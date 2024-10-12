{ config, pkgs, ... }:

{
  imports = [];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Toronto";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable auto upgrade of the selected nixos channel
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://channels.nixos.org/nixos-24.05";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Do Not Change!!
  system.stateVersion = "24.05"; # Did you read the comment?
}
