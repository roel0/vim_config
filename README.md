# Roel0's vim configuration

This is my personal vim configuration which is optimized for my needs and for c development. Feel free to use it if you like it!
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
	sh ./cscope_gen.sh
```
## How to update to latest version?

Rerun the installation script, it wil fetch the latest updates for you!



## Included Plugins


* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manages the runtime path of the plugins
* [NERDTree.vim](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder
* [taglist.vim](https://github.com/vim-scripts/taglist.vim): Source code browser
* [gundo.vim](https://github.com/sjl/gundo.vim): Graphical undo tree
* [neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim): Autocomplete
* [cctree.vim](https://github.com/hari-rangarajan/CCTree): A c tree call tree
* [cscope_maps.vim](https://github.com/chazy/cscope_maps): Key mappings for cscope
* [startify.vim](https://github.com/mhinz/vim-startify): A custom start up screen

## Included color schemes

* [peaksea](https://github.com/vim-scripts/peaksea)

