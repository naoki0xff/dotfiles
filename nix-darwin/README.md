## ABOUT

This README gives an easy instruction of setting up Nix.  

## HOW TO START YOUR NIX CONFIGURATION

#### Setup Nix

All the installation steps are based on the recommendation of official nix-darwin's [github page](https://github.com/nix-darwin/nix-darwin#uninstalling).


#### Install Lix (`nix` binary)
```
$ curl -sSf -L https://install.lix.systems/lix | sh -s -- install
```
See [Installing Lix](https://lix.systems/install/#on-any-other-linuxmacos-system) for installation detail.  

After installing Lix, you need to open a new shell or run `. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh`

#### Migrate Configuration

```
$ sudo mkdir -p /etc/nix-darwin
$ sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
$ cd /etc/nix-darwin

$ cp -R {path_to_this_folder} .
$ gsed -i -E "s/^( *localhostname *= *)\"[^\"]*\";/\1\"$(scutil --get LocalHostName)\";/" flake.nix
$ gsed -i -E "s/^( *system *= *)\"[^\"]*\";/\1\"$(uname -m)-darwin\";/" flake.nix //NOTE: Since "arm64-darwin" is not supported, you should use "aarch64-darwin" instead.
$ sudo nix run nix-darwin/master#darwin-rebuild -- switch
```

After this step, you can find `darwin-rebuild` binary on your PATH.

## After Installation

#### Change Configuration

**Mac OS**
```
$ cd /etc/nix-darwin
$ sudo darwin-rebuild switch
```
