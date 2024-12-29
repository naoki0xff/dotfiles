## ABOUT

This README will give an instruction of how to setup nix(nixpkgs) with your environment.

Since nixpkg's availability are not always the same with your working environment (i.e. linux openssl-devel vs darwin libssl), this configuration is not meant to dynamically change its behavior based on building platform.

## HOW TO CONFIGURE YOUR NIX ENVIRONMENT

#### Setup nix

```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

For nix flake, you need to activate this feature by

```
mkdir -p ${XDG_CONFIG_HOME}/nix
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
cp -R ./home-manager ${XDG_CONFIG_HOME}
```

then

```
cd ${XDG_CONFIG_HOME}/home-manager/
home-manager switch --flake .
```

---

**CAVEATS**:

See `man home-configuration.nix` for further detail of home-manager.
