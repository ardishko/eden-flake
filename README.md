# eden-flake

Nix flake for the [Eden](https://eden-emu.dev) Nintendo Switch emulator.

## Usage

This is just the package, no options or anything. Plain and simple. I don't plan to add those but feel to send a PR if you think that's right for this kind of project though.

### 1. Add the flake input

```nix
inputs.eden-flake.url = "github:ardishko/eden-flake";
```

### 2. Install the package

(given that you've passed the inputs to the file where you define your packages...)

**Home Manager:**
```nix
home.packages = [ inputs.eden-flake.packages.${pkgs.system}.eden ];
```

**NixOS:**
```nix
environment.systemPackages = [ inputs.eden-flake.packages.${pkgs.system}.eden ];
```

## Updates

The auto-updater is currently WIP, however below is how it's supposed to work:

The package is automatically updated daily via GitHub Actions. When a new Eden release is detected with a Linux AppImage, the package link is updated and a PR is opened. If the build passes, the PR is merged automatically.
