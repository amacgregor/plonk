# Plonk

Plonk is an Elixir-based micro-generator framework designed to streamline the process of creating files with a consistent structure. It is inspired by the JavaScript tool Plop, but tailored specifically for the Elixir ecosystem. Plonk is particularly useful for projects where maintaining a consistent file structure and coding standard is crucial.

## Features

- **Customizable Templates**: Easily create and maintain a variety of templates.
- **Dynamic File Generation**: Generate files with names based on user input or predefined patterns.
- **Interactive CLI**: Guided user inputs through an interactive CLI.
- **Extensible**: Add custom functions to templates for greater flexibility.

## Installation

1. **Add Plonk to Your Mix Project**

   Add Plonk to your list of dependencies in `mix.exs`:

   ```elixir
   def deps do
     [
       {:plonk, "~> 1.0.0"}
     ]
   end
   ```

2. **Install Dependencies**

   Run the following command in your terminal:

   ```bash
   mix deps.get
   ```

## Usage

To use Plonk:

1. **Define Your Templates**

   Create EEx templates in the `templates` directory of your project.

2. **Configure Your Generators**

   Define generators in `generator_config.ex` with specific prompts and associated template files.

3. **Run Plonk**

   Execute Plonk from the command line:

   ```bash
   mix plonk.run
   ```

4. **Follow the CLI Prompts**

   Plonk will guide you through a series of prompts based on the selected generator.

## Customization

- **Adding New Templates**: Place new EEx templates in the `templates` directory.
- **Creating New Generators**: Modify `generator_config.ex` to define new generators with custom prompts and templates.

## Contributing

Contributions are welcome and greatly appreciated. Please follow these steps to contribute:

1. **Fork the Repository**
2. **Create a Branch**: `git checkout -b <branch_name>`
3. **Make Your Changes**
4. **Commit Your Changes**: `git commit -am 'Add some feature'`
5. **Push to the Branch**: `git push origin <branch_name>`
6. **Submit a Pull Request**

## Support

If you encounter any issues or have questions, feel free to open an issue in the project's GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE.md).

