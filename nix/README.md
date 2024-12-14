## ABOUT

This README will give an instruction of how to setup nix(nixpkgs) with your environment.

Since nixpkgs are installed differently depending on your working environment, there isn't such one-config-covers-all but per plafrom configurations are available in this project.

---

## HOW TO CONFIGURE YOUR NIX ENVIRONMENT

#### Setup nix

```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

For nix flake, you need to activate this feature by

```
mkdir -p ${XDG\_CONFIG\_HOME}/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

#### Add homemaanger binary

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

#### Apply settings

**Start from scratch**
```
nix run home-manager/master -- init
```

or

**Use existing template**
```
cp -R ./home-manager ${XDG\_CONFIG\_HOME}
```

then

```
cd ${XDG\_CONFIG\_HOME}/home-manager/
home-manager switch --flake .
```

---

**CAVEATS**:

See `man home-configuration.nix` for further detail of home-manager.
