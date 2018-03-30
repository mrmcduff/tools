# Redroid

For when designers give you iOS resources, but you're developing for android. This script takes a typical iOS designer output and compresses and repackages it for android development.

If you have a folder that looks something like the following:
```
First Image@3x.png
First Image@2x.png
Another Thing With Spaces@2x.png
Another Thing With Spaces@3x.png
```
and you need them to look a little more like
```
xhdpi/package_prefix_first_image.png
xhdpi/package_prefix_another_thing_with_spaces.png
xxhdpi/package_prefix_first_image.png
xxhdpi/package_prefix_another_thing_with_spaces.png
```
then this little script ought to do you.

## Getting Started

Go ahead and download the shell script.

### Prerequisites

You'll need a bash shell, and to have [optipng](http://optipng.sourceforge.net/) on your path. I recommend using Homebrew to install optipng. This does not use Bash 4.0, because that isn't installed on a Mac by default.

```
brew install optipng
```
If you can run shell scripts and get output from `optipng -v`, you're in good shape.


## Running the script

My bash-fu is a little weak, so this script doesn't have a lot of bells and whistles baked in. It expects exactly two arguments: the target folder (where all your pngs are) and the package prefix. It doesn't yet support an empty package prefix.

```
./redroid.sh path/to/targets my_prefix
```

If the contents of `targets` are `.png` files that are text-formatted for iOS (including spaces and capital letters), the script will do the following things:
1. Replace whitespace with underscores.
2. Move the files into `xhdpi` or `xxhdpi` folders, depending on whether they are `@2x` or `@3x`. (Also, it will remove the `@[2,3]x` characters).
3. Add the second argument as a prefix, attaching it with an underscore.
4. Run a default optipng compression on the final output.

For example:
`/.../targets/File Name@2x.png` will become `/.../targets/xhdpi/prefix_file_name.png`

## Updates

This is a tool for personal use, so I tailored it to what was simplest for me at the time of maximum frustration. I may update it in the future as needs arise, or if I'm feeling ambitious about getting it to work in more cases.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

