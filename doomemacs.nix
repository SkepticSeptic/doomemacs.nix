# emacs config to then separately install DOOMemacs with
{ config, pkgs, ... }:

let
  doomEmacs = pkgs.emacsPackagesFor pkgs.emacs-pgtk; # TODO: should be emacs 30.1 in nixpkgs unstable but may change. pin it somehow? idk do i look like a top
in {                              # emacs pure GTK, for wayland compatibility. change to just emacs if using x11
  services.emacs = {
    enable = true;
    package = doomEmacs.emacs;
  };

  environment.systemPackages = with pkgs; [
    git
    ripgrep
    fd
    gnutar
    findutils
    coreutils
    gcc
    binutils
    libgccjit  # for native-comp support
    # terminal
    (pkgs.emacsPackagesFor doomEmacs.emacs).vterm  # vterm is a term emulator in doom
    cmake
    libtool
    automake
    autoconf
    pkg-config
    libvterm
    gnumake
    # additional dependencies
    ispell
    shellcheck
    multimarkdown
    editorconfig-core-c
    nixfmt-rfc-style
    findutils
    python3Full # treemacs dep
    isort
    pipenv
    openjdk17-bootstrap
    nodejs_22
  ]; 
}
