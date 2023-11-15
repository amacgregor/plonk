defmodule Plonk.GeneratorConfig do
  def generators do
    [
      %{
        name: "Example Generator",
        template: "example_template.eex",
        prompts: [
          %{type: :text, message: "Enter the title", key: :title, options: [color: :light_green]},
          %{
            type: :text,
            message: "Enter the category",
            key: :category,
            options: [color: :light_green]
          },
          %{
            type: :text,
            message: "Enter the description",
            key: :description,
            options: [color: :light_green]
          },
          %{
            type: :text,
            message: "Enter tags (comma-separated)",
            key: :tags,
            options: [color: :light_green]
          }
        ]
      },
      %{
        name: "Blog Post (Markdown)",
        template: "blog_post.eex",
        prompts: [
          %{type: :text, message: "Enter the title", key: :title, options: [color: :light_green]},
          %{
            type: :text,
            message: "Enter the category",
            key: :category,
            options: [color: :light_green]
          },
          %{
            type: :text,
            message: "Enter the description",
            key: :description,
            options: [color: :light_green]
          },
          %{
            type: :text,
            message: "Enter tags (comma-separated)",
            key: :tags,
            options: [color: :light_green]
          },
          %{
            type: :boolean,
            message: "Is it published?",
            key: :published,
            options: [color: :light_green]
          }
        ]
      },
      %{
        name: "TIL Post (Markdown)",
        template: "til_post.eex",
        prompts: [
          %{type: :text, message: "Enter the title", key: :title},
          %{
            type: :text,
            message: "What did you learned? (240 chars)",
            key: :description,
            options: [max: 240, color: :light_green]
          },
          %{type: :text, message: "Enter tags (comma-separated)", key: :tags},
          %{type: :boolean, message: "Is it published?", key: :published}
        ]
      }
    ]
  end
end
