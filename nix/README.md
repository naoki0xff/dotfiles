## how to install

#### Add nix
sh <(curl -L https://nixos.org/nix/install) --daemon
or
https://github.com/DeterminateSystems/nix-installer

## Add nixpkgs (Is this neccesary?)
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

## Add homemaanger

cd ~/.config/nix/
nix run home-manager/release-24.11 -- init --switch

or

(nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager)
(nix-channel --update)
(nix-shell '<home-manager>' -A install)

---

## Apply settings

cd ~/.config/home-manager/
home-manager switch

---

CAVEATS:
Run 'man home-configuration.nix'
