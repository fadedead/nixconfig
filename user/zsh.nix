{ pkgs, ... }:

let
  myAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    nvcon = "nvim ~/.config/nvim";
    gitstpush = "git subtree push --prefix dist origin gh-pages";
    configu = "home-manager switch --flake ~/.dotfiles";
    systemu = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    sf = "cd $(dirname $(fd --type file | fzf))";
    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=4096M -p CPUQuota=60% nixos-rebuild";
    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=4096M -p CPUQuota=60% home-manager";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = false;
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

