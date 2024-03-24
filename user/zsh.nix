{ pkgs, ... }:

let
  myAliases = {
    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=16000M -p CPUQuota=60% home-manager";
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

