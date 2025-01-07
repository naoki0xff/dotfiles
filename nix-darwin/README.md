## ABOUT

This README will give an instruction of how to setup nix(nixpkgs) with your environment.  
This repository aims to deploy desired packages and its configuration just for Mac OS. You need to well translate each settings when you want to do the same with other platforms.

## HOW TO CONFIGURE YOUR NIX ENVIRONMENT

#### Setup nix

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```
See [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#determinate-nix-installer) for installation detail.  
When you want to use Determinate Nix + Nix-Darwin, installation of nix binary should be done without '--determinate' flag.
You can set up Determinate using the darwinModules.default module output from the [determinate flake](https://github.com/DeterminateSystems/determinate).

#### Add homemaanger module

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```
See Home Manager [nix-darwin module](https://nix-community.github.io/home-manager/index.xhtml#sec-install-nix-darwin-module) for installation detail.

#### Add nix-darwin binary & load nix-darwin configurations

```
cd ~/.config/nix-darwin
nix run nix-darwin -- switch --flake .
```
See [nix-darwin](https://github.com/LnL7/nix-darwin?tab=readme-ov-file) for installation detail.

#### Apply settings

**Mac OS**
```
darwin-rebuild switch --show-trace --flake .#${username}@${system}
```
