defmodule Plonk.GeneratorConfig do
  def generators do
    [
      %{
        name: "Example Generator",
        template: "example_template.eex",
        prompts: [
          %{type: :text, message: "Enter the title:", key: :title},
          %{type: :text, message: "Enter the category:", key: :category},
          %{type: :text, message: "Enter the description:", key: :description},
          %{type: :text, message: "Enter tags (comma-separated):", key: :tags}
        ]
      },
      %{
        name: "Markdown Article",
        template: "markdown_article.eex",
        prompts: [
          %{type: :text, message: "Enter the title:", key: :title},
          %{type: :text, message: "Enter the category:", key: :category},
          %{type: :text, message: "Enter the description:", key: :description},
          %{type: :text, message: "Enter tags (comma-separated):", key: :tags},
          %{type: :boolean, message: "Is it published?", key: :published}
        ]
      },
      %{
        name: "TIL Post (Markdown)",
        template: "til_post.eex",
        prompts: [
          %{type: :text, message: "Enter the title:", key: :title},
          %{type: :text, message: "What did you learned? (240 chars):", key: :description},
          %{type: :text, message: "Enter tags (comma-separated):", key: :tags},
          %{type: :boolean, message: "Is it published?", key: :published}

        ]
      }

    ]
  end
end
