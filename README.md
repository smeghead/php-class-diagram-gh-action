# php-class-diagram-gh-action

Github Actions CI action of php-class-diagram.

## Inputs

## `src-directory`

**Required** Specify the target directory in the repository for which you want to generate class diagrams. Default `"src"`.

## `output-path`

Specify the file path of the image to output. Default `diagram.png`.

## `options`

If necessary, specify options to add to `php-class-diagram`. Default ``.

## Example usage

This is an example of creating a class diagram from the directory for which you want to create a class diagram in the checked out workspace and uploading it as a artifact.

 * .github/workflows/php-class-diagram.yml

```
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
          output-path: diagram.png

      - name: Upload Artifact
        uses: actions/upload-artifact@v4
        with:
          name: Class_Diagram
          path: diagram.png
          retention-days: 5
```

