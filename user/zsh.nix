{ pkgs, ... }:

let
  myAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    nixcon = "nvim ~/nixconfig/";
    nvcon = "nvim ~/.config/nvim";
    dotcon = "nvim ~/dotfiles";
    gitstpush = "git subtree push --prefix dist origin gh-pages";
    configu = "home-manager switch --flake ~/nixconfig";
    systemu = "sudo nixos-rebuild switch --flake ~/nixconfig";
    sf = "cd $(dirname $(fd --type file | fzf))";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = false;
      shellAliases = myAliases;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
        ];
      };
      initExtra = ''
        PROMPT='%F{#cba6f7}[%~]%f
        %F{#cba6f7}→%f '
        [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
      '';
    };
  };
}

