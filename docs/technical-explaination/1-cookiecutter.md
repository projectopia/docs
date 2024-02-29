# Scaffold with cookiecutter

![Cookiecutter](https://assets.website-files.com/6189495a8f80ad3e20ebcf60/619d6200609e0d829c3374ae_Group%201171273931.png)

## Introduction

Cookiecutter is a command-line utility that generates projects from project templates. These templates are directories containing files and folders, along with a cookiecutter.json file that defines variables and default values used during project generation. This deep dive will cover how to create a scaffold and apply a scaffold template using Cookiecutter.

## Step-by-Step Guide

### Installing Cookiecutter

Before we begin, make sure you have Cookiecutter installed. You can install it using pip:

```bash
pip install cookiecutter
```

!!!example "Pip Installation Note"
    Note that you should install pip directly from your global python environment.
    You should not use a virtual environment to install cookiecutter.

### Creating a Scaffold

o create a new Cookiecutter template, you need to create a directory with the structure you want for your project, along with a cookiecutter.json file. Let's create a simple template for a Python project:

Create a new directory for your template:

```bash
mkdir cookiecutter-template
```

Inside the cookiecutter-template directory, create the following files and folders:

```markdown
cookiecutter-template
├── {{cookiecutter.project_slug}}
│   └──README.md
└── cookiecutter.json
```

Add content to the files: README.md:

```markdown
# {{cookiecutter.project_name}}
```

Add content to the files: cookiecutter.json:

```json
{
  "project_name": "Your project name",
  "project_slug": "{{ cookiecutter.project_name.replace(' ', '_').lower() }}"
}
```

!!!note
    The project_slug variable is used to create a **normalized** name from the project_name variable.

### Generating a Project from the Scaffold

Now that you've created your template, you can use it to generate a new project:

Run Cookiecutter and provide the path to your template directory:

```bash
cookiecutter <cookiecutter-template-url>
```

Cookiecutter will prompt you to provide values for the variables defined in cookiecutter.json:

```plaintext
project_name [Your project name]: My Python Project
project_slug [my_python_project]:
```

!!!example "Cookiecutter Prompt"
    For `project_slug`, please Enter to accept the default value (normalized project name)

Press Enter to accept the default value or provide a new value and press Enter.

After providing all the values, Cookiecutter will generate your project in a new directory with the name you specified. You can now navigate to this directory and start working on your project:

```bash
cd my-python-project
```

## Cruft

![Cruft Scaffold](https://raw.github.com/cruft/cruft/master/art/logo_large.png)

> Cruft is like Cookiecutter orchestration. It allows you to manage multiple Cookiecutter templates in a single repository, and it can be used to update your project to the latest version of the template, or change the input values after the project has been generated.

Cruft is an optional tool that can be used to manage the lifecycle of your project. It can be used to update your project to the latest version of the template, or to remove files that are no longer needed.

### Installing Cruft

Before we begin, make sure you have Cruft installed. You can install it using pip:

```bash
pip install cruft
```

### Creating a Scaffold with Cruft

The structure of the scaffold is the same as the previous example. The only difference is that you need to add a .cruft.json file to the template directory. This file is used to define the configuration for Cruft.

!!!note
    But cruft can ultilize multiple templates inside a single repository (with different branch or on the same branch). For more information, please refer to the [Cruft Documentation](https://cruft.github.io/cruft/)

### Applying a Scaffold Template with Cruft

To apply a scaffold template with Cruft, you can use the following command:

```bash
cruft create <cookiecutter-template-url> --checkout <branch> --directory <template-directory>
```

!!!example "Cruft Command"
    - `--checkout` is used to specify the branch of the template. Default is your `master/main`. branch
    - `--directory` is used to specify the directory of the template. Default is the root directory of the repository.

!!!note "Directory Note"
    Just use the `--directory` option if your template is in a subdirectory of the repository, or you have multiple templates in the same repository.

After you enter the command, Cruft will prompt you to provide values for the variables defined in `cookiecutter.json`, and it will be the same as the previous example.

### Updating a Project with Cruft

The special of Cruft is that it can genarate a special file called `.cruft.json` in the root of the generated project. This file is used to define the configuration for Cruft. You can use this file to update your project to the latest version of the template.

The file will look like this:

```json
{
  "template": {
    "url": "<cookiecutter-template-url>",
    "checkout": "<branch>",
    "directory": "<template-directory>",
    "context": {
      "project_name": "My Python Project",
      "project_slug": "my_python_project"
    }
  }
}
```

This file is used to define the configuration for Cruft. You can use this file to update your project to the latest version of the template, or when you want to **change the input values for the template**.

```bash
cruft update
```

## Conclusion

Cookiecutter is a powerful tool for generating project scaffolds from templates. By creating your own templates, you can quickly set up new projects with predefined structures and files, saving you time and ensuring consistency across your projects.
