# php-class-diagram-gh-action

Github Actions CI action of php-class-diagram.

> A CLI tool that parses the PHP source directory and generates PlantUML class diagram scripts as output.
> [php-class-diagram](https://github.com/smeghead/php-class-diagram)


This is a Github Actions action that uses php-class-diagram to generate a class diagram from PHP source code.
This action places a class diagram with the specified file name in the runner's default working directory (GITHUB_WORKSPACE).

[Accessing files created by a container action | Creating a Docker container action - GitHub Docs](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#accessing-files-created-by-a-container-action)

After you generate the diagram in your working directory with this action, use another action to upload it to an artifact, deploy it to Github Pages, or commit it to your repository.

## Inputs

## `target-path`

**Required** Specify the target source code directory in the repository for which you want to generate class diagrams. Default `"src"`.

## `output-path`

Specify the file path of the image to output. Default `php-class-diagram.png`.

## `options`

If necessary, specify options to add to `php-class-diagram`. Default ``.

## `target-repo`

Specify github repository. (ex. smeghead/php-class-diagram)

## `target-branch`

Specify branch name of github repository. (ex. main)

## Example usage

This is an example of creating a class diagram from the directory for which you want to create a class diagram in the checked out workspace and uploading it as a artifact.

 * .github/workflows/php-class-diagram.yml

```
name: PHP Class Diagram

on: [push]

jobs:
  create-class-diagram:
    runs-on: ubuntu-latest
    name: Create class diagram
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Create class diagram
        id: create-class-diagram
        uses: smeghead/php-class-diagram-gh-action@v0
        with:
          target-path: src
          output-path: diagram.svg
          target-repo: ${{ github.repository }}
          target-branch: ${{ github.ref_name }}

      - name: Upload Artifact
        uses: actions/upload-artifact@v4
        with:
          name: Class_Diagram
          path: diagram.svg
          retention-days: 5
```

In addition to uploading to an artifact, you can use the following actions to deploy to Github Pages.

* [actions/deploy-pages: GitHub Action to publish artifacts to GitHub Pages for deployments](https://github.com/actions/deploy-pages)
