# Roel0's vim configuration

This is my personal vim configuration which is optimized for C development. Feel free to use it if you like it! 

Anyone may send in pull request for improvements!


## How to install

The vim configuration can be easily installed by running the provided script

	git clone https://github.com/roel0/vim_config /a/local/path
	sh /a/local/path/install.sh  [options] ARG

	Options:
	   -h, --help       Display this message.
	   -n               Dry-run; only show what would be done.
	   -d, --dest ARG   Installation directory (Default is ~)

## Additional 

In order to enable the full power of this vim configuration, install the following tools on your system:

* [the silver searcher](https://github.com/ggreer/the_silver_searcher) (ag) CtrlP will be twice as fast! 
* [ctags](https://sourceforge.net/projects/ctags/) For browsing source code with tags
```
	Usage: Generarte a tag file in the root of your source tree
	ctags -R
```	
* [cscope](http://cscope.sourceforge.net/) An even more powerfull source code browser
```
	Usage: Run the provided script in the root of your source tree
	sh cscope_gen.sh
```
## How to update to latest version?

Rerun the installation script, it wil fetch the latest updates for you!


## Included Plugins

The plugins provided are all chosen in function of working speed and/or convenience. I escpacialy like to move around in big source projects with the help of the CtrlP and Cscope plugins. NerdTree is a classic way to explore your project and gives a more IDE feeling to vim and thus it's much slower. It is a bad habit to use it over CtrlP. However their are rare situations where it's still convenient to have.

* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder, so good it should be illegal!
* [cscope_maps.vim](https://github.com/chazy/cscope_maps): My favorite key mappings for cscope
* [gundo.vim](https://github.com/sjl/gundo.vim): Graphical undo tree
* [taglist.vim](https://github.com/vim-scripts/taglist.vim): Source code browser
* [neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim): Autocomplete
* [startify.vim](https://github.com/mhinz/vim-startify): A custom start up screen
* [cctree.vim](https://github.com/hari-rangarajan/CCTree): A c tree call tree
* [NERDTree.vim](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manages the runtime path of the plugins

## Included color schemes

* [peaksea](https://github.com/vim-scripts/peaksea)

## Included functions

* **LoadCscope** Automaticly locates on the startup the cscope database in your source tree and loads it.
* **DeleteTrailingWS** Automaticly deletes all trailing whitespaces when you save a file with [.c|.h|.py] extension
* **LoadCCTree** Load the CCTree database. This can take some time, thats why this function is not called on the startup (see mappings)
* **ToggleNumber** Toggle between relative and normal line numbering (see mappings)
