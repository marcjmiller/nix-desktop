{
  config,
  pkgs,
  ...
}:
let
  inherit (import ./variables.nix)
    wallpaperImg
    ;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./gaming
  ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;

      windows = {
        "windows" =
          let
            # To determine the name of the windows boot drive, boot into edk2 first, then run
            # `map -c` to get drive aliases, and try out running `FS1:`, then `ls EFI` to check
            # which alias corresponds to which EFI partition.
            boot-drive = "FS1";
          in
          {
            title = "Windows";
            efiDeviceHandle = boot-drive;
            sortKey = "y_windows";
          };
      };

      edk2-uefi-shell.enable = true;
      edk2-uefi-shell.sortKey = "z_edk2";
    };
  };

  # Networking
  networking = {
    extraHosts = ''
      0.0.0.0       modules-cdn.eac-prod.on.epicgames.com
    '';
    hostName = "nix-desktop"; # Define your hostname.
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };
  };

  # Time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services = {
    # Enable GNOME (for the login manager, replace this later)
    displayManager.gdm.enable = true;

    # Gnome Keyring for git credential helper
    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;

    # Disable short power button shutdown
    logind.powerKey = "ignore";

    # Enable Ollama
    ollama = {
      package = pkgs.ollama-rocm;
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "11.0.0";
      environmentVariables = {
        ROCR_VISIBLE_DEVICES = "0";
      };
    };

    open-webui = {
      enable = true;
      host = "0.0.0.0";
    };

    pipewire = {
      extraConfig.pipewire."10-disable-autogaincontrol" = ''
        pulse.rules = [
          {
            matches = [
              {
                node.name = "~alsa_input.*"
              }
            ]
            actions = {
              update-props = {
                # disable auto volume
                pulse.ignore-sink-volume = true
              }
            }
          }
        ]
      '';
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  hardware = {
    # Enable bluetooth
    bluetooth.enable = true;

    # Enable OpenCL
    amdgpu.opencl.enable = true;
  };

  # Setup 48GB swapfile for AI-Generation RAM offloading
  swapDevices = [
    {
      device = "/swapfile";
      size = 48 * 1024;
    }
  ];

  # Enable Docker
  virtualisation.docker = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcm = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Marc Miller";
    extraGroups = [
      "bluetooth"
      "docker"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  # Stylix for theming
  stylix = {
    image = ./files/wallpapers/${wallpaperImg};
  };
  home-manager.extraSpecialArgs.stylixColors = config.lib.stylix.colors;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    seahorse.enable = true;
    zsh.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Use Home.nix instead of this
  # environment.systemPackages = with pkgs; [
  #   minecraft.lunar
  # ];

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8080
      8888
    ];
    # allowedUDPPorts = [ ... ];
  };

  # This value is the initial NixOS release installed
  system.stateVersion = "25.05";

  security = {
    # Swap sudo for the rust implementation
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
    sudo.enable = false;

    # RealtimeKit, needed for Pulse/PipeWire
    rtkit.enable = true;
  };

  # Turn on Flakes
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://ai.cachix.org"
    ];
    trusted-public-keys = [
      "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
      "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
    ];
  };
}
