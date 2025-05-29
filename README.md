# doomemacs.nix
An OOTB working environment for installing/using DOOM Emacs: https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org 


# Usage
1. Install and add to your configuration.nix
```
imports =
    [
      ./hardware-configuration.nix
      # Include the results of the hardware scan.
      ./doomemacs.nix
      # Include doomemacs dependencies
```

2. Install DOOM emacs if you haven't already:
```
   git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```
3. (optional) Add DOOM to PATH:
```
  # ~/.bashrc|zshrc equivalent
  programs.bash.interactiveShellInit = ''
      #fastfetch # optional
      #alias la='ls -a' # optional
      #alias dim='emacs -nw' # optional, use doom text mode as editor (slow as balls, i wouldn't)
      export PATH="$HOME/.config/emacs/bin:$PATH"
    '';
```
4. Sync and dr check to make sure all is well
```
doom sync && doom doctor
```
(note: currently there's 3 warnings for python, still works just fine, just missing nosetests, pytest, & setuptools FIXME)

5. Send it
```
doom
```
