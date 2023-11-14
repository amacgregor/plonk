defmodule Plonk.Generator do
  @moduledoc """
  The Generator module for the Plonk application. Handles loading of templates,
  rendering them with provided data, and generating files.
  """

  # Function to load a template file
  def load_template(template_name) do
    # Assuming templates are stored in a directory named 'templates' in the root of the project
    template_path = Path.join(["templates", template_name])

    case File.read(template_path) do
      {:ok, content} -> {:ok, content}
      {:error, reason} -> {:error, reason}
    end
  end

  # Function to render the template with given data
  def render_template(template, data) when is_binary(template) and is_map(data) do
    bindings = map_to_bindings(data)
    EEx.eval_string(template, bindings)
  end

  defp map_to_bindings(map) do
    map
    |> Enum.map(fn {key, value} -> {key, value} end)
  end

  # Function to generate a file with the given content
  def generate_file(file_name, content) when is_binary(file_name) and is_binary(content) do
    # Specify the directory where files will be generated, e.g., "output"
    output_dir = "output"
    output_path = Path.join([output_dir, file_name])

    # Create the output directory if it does not exist
    File.mkdir_p(output_dir)

    case File.write(output_path, content) do
      :ok -> {:ok, output_path}
      {:error, reason} -> {:error, reason}
    end
  end
end
