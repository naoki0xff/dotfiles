## Import NixOS to WSL

See [NixOS-WSL](https:/github.com/nix-community/NixOS-WSL?tab=readme-ov-file) for installation detail.

## Setup Nix

After you have successfully started windows terminal with NixOS profile,

#### Init environment
```
$ sudo nix-channel --update
$ sudo nixos-rebuild switch
```

#### Init config directory
```
$ mkdir -p ~/.config/nix
$ echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
$ nix flake init # See if your platform matches to repository's configuration
```

#### Install vim for temporary file edit
 
```
$ nix-shell -p vim
```

#### Edit /etc/resolv.conf to establish outbound connection (WSL only)
```
$ sudo vim /etc/resolv.conf
=> Change "nameserver {x.x.x.x}" to "nameserver 8.8.8.8"
$ chattr -f +i /etc/resolv.conf
```

### Create default NixOS configuration
i). Create template
```
sudo nixos-generatet-config
=> /etc/nixos/{configuration.nix,hardware-configuration.nix} will be generated
```
ii). Merge with repository's template
```
(Do your job!!)
```

#### Activate your configuration
```
sudo nixos-rebuild switch --flake .#${username}@${system} --impure
```
And restart your system.
