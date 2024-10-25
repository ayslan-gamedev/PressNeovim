# Press Neovim
This is my personal Neovim condiguration.

## Languages supporteds:
- clangd (c, cpp) and Cmake config tools
- lua
- python
- gdscript
- webdevelopment basics (html, css and javascript(no freameworks tested))
- markdown

## whant to use my Press Neovim? 

if you already have a neovim config but want to test my config, use this command:

```
mv ~/.config/nvim ~/.config/nvim.bak
```

also clean the neovim folders, its optional but recomended

```
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

just clone the repo:
```
git clone https://github.com/ayslan-gamedev/PressNeovim.git ~/.config/nvim
```

if you want to turn back to the your old configure just use this command:
```
mv ~/.config/nvim.bak ~/.config/nvim
```

and this case you want the folders back too:
```
mv ~/.local/share/nvim.bak ~/.local/share/nvim
mv ~/.local/state/nvim.bak ~/.local/state/nvim
mv ~/.cache/nvim.bak ~/.cache/nvim
```

## I still updating my config, here what I want to do, you can help me if you want:
TODO:
- add keybind to resize splits
- add a better session management 
- refact documentation
- add debugger support
- add something to help resolve git merge conflicts
- add something to minimize code (mybe ufo?)
- add a code outline window
- test somes js freameworks (like react)
- add csharp support

## Want help me with the project?
if you want to help me to my configure feel free to make issues, or make pull requests
I also don't will merge your PR to main instantily because main branch is just LTS versions.

if you wanna contribute, make a PR and describe what kind of alterations you done, I awalys accept new features, 
but if your feature is not listed in todo list, describe your feature, and show exemples of use.

## LICENSE
this project have MIT license, feel free to fork and use however you want.
