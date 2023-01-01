{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ripnyt";
  home.homeDirectory = "/home/ripnyt";

  # Packages

  home.packages = with pkgs; [
      telegram-cli
      tdesktop
      signal-desktop
      gparted
      tmux
      curl
      teams
      discord
      obsidian
      firefox
      nerdfonts
      dunst
  ];

  # Programs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      update = "sudo nixos-rebuild switch";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      initExtra = ''
     eval "$(starship init zsh)"
     export POWERLEVEL9K_MODE=nerdfont-complete
     source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                           ''
];
  };

  # Services
    services.dunst.enable = true;


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
