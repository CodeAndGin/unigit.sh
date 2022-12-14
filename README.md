# Unigit

A stupidly named shell script to quickly initialise a git repo in a unity project.

## Installation

**Dependencies**:

`git` and `wget`

**Manual Install**

Copy `unigit.sh` into any folder in your `$PATH`. I recommend adding `$HOME/bin` or `$HOME/.local/bin` to your `$PATH` if you havent already.

## Usage

Run `unigit.sh` from inside any Unity Project Directory, including child directories. `unigit.sh` will search up parent directories until it finds one that matches the structure of the root folder of a Unity Directory and then will initialise a git repo, wget [the .gitignore](https://gist.github.com/linojon/8f92dd5c2e80d31fc23ed72d9d59342f) and [the .gitattributes](https://gist.github.com/linojon/1b7736ba75d5342085f9238c04195bf1) files, stage and commit the initial commit. It does not currently deal with connecting to remotes. It will also not run if it detects a .git directory or if it doesn't find the right directory structure.

## Credits

[CodeAndGin](https://github.com/CodeAndGin): Author
[linojon](https://gist.github.com/linojon): .gitignore and .gitattributes

## Licence

[MIT](https://en.wikipedia.org/wiki/MIT_License)


