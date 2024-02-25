# Forthright Typst CV template

This is a Typst CV template visually based on the [Neat CV template](https://github.com/UntimelyCreation/typst-neat-cv), but completely rewritten with the aim of being tweak-friendly:
- Many parameters can be fine-tuned by editing the `settings.typ` file in the `src` subdirectory. This can be handy if you need a little bit more room to make everything fit in one page 😇
- The template itself, `src/template.typ`, is fairly short and reasonably well-commented.

A demo can be found [here](https://github.com/glocq/typst-forthright-cv/blob/master/output/cv.pdf).

## Usage

You need [the Typst compiler](https://github.com/typst/typst/releases/tag/v0.10.0) installed. On MacOS/Linux, navigate to this directory and compile the document by executing the following command:

```bash
typst compile src/cv.typ output/cv.pdf --font-path src/fonts/
```

`cv.pdf` should then appear in `output/`.

To have Typst recompile your document each time you edit something, replace the word `compile` in the above command by `watch`.

## License

Distributed under the MIT License.
