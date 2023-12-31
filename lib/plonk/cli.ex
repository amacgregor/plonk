defmodule Plonk.CLI do
  def run do
    generators = Plonk.GeneratorConfig.generators()
    generator_names = Enum.map(generators, fn g -> g[:name] end)
    choice = Prompt.select("Choose a generator:", generator_names)

    selected_generator = Enum.find(generators, fn g -> g[:name] == choice end)
    data = collect_data(selected_generator[:prompts])

    confirm = Prompt.confirm("Do you want to create this file?", default_answer: :yes)

    if confirm === :yes do
      template_name = selected_generator[:template]
      {:ok, template} = Plonk.Generator.load_template(template_name)

      # Generate file name from title
      file_name = generate_file_name(data[:title])

      rendered_content = Plonk.Generator.render_template(template, data)
      Plonk.Generator.generate_file(file_name, rendered_content)

      IO.puts("File #{file_name} created successfully.")
    else
      IO.puts("File creation cancelled.")
    end
  end

  defp collect_data(prompts) do
    Enum.reduce(prompts, %{}, fn %{type: type, message: message, key: key, options: options}, acc ->
      value =
        case type do
          :text ->
            Prompt.text(message, options)

          :boolean ->
            Prompt.confirm(message, options)

          :choice ->
            {choices, options_without_choices} = extract_choices(options)

            Prompt.choice(message, choices, options_without_choices)

          :select ->
            {choices, options_without_choices} = extract_choices(options)

            Prompt.select(message, choices, options_without_choices)
        end

      Map.put(acc, key, value)
    end)
  end

  # Function to extract choices
  defp extract_choices(options) do
    # Find the choices list
    choices = Keyword.get(options, :choices, [])

    # Create a version of options without the choices
    options_without_choices = Keyword.drop(options, [:choices])

    {choices, options_without_choices}
  end


  defp generate_file_name(title, extension \\ "md") do
    current_date =
      DateTime.utc_now()
      |> DateTime.to_iso8601()
      |> String.split("T")
      |> List.first()
      |> String.replace("-", "")

    normalized_title =
      title
      |> String.downcase()
      # Remove non-word characters
      |> String.replace(~r/[^\w\s]/, "")
      # Replace spaces with underscores
      |> String.replace(~r/\s+/, "_")

    # Append file extension, e.g., .txt
    "#{current_date}_#{normalized_title}.#{extension}"
  end
end
