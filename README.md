Two versions of Conway's game of Life. One is a fairly standard version, the
other is very slow, but specified in an interesting way. The slow version is found in LifeSlow.hs.

# Build with Nix

Our primary computers all run NixOS, and the following instructions worked for us on those. Note that Nix is enabled in our global Stack configurations and we have Nix installing some native dependencies for us.

```shell
$ stack build
$ stack exec -- conway
```

If you do not already have Nix enabled in your global Stack configuration, you can enable Nix for this project by adding it to the `stack.yaml` for this project as follows:

```yaml
nix: 
  enable: true
```

or by building it with the `--nix` flag:

```shell
$ stack build --nix
$ stack exec --nix -- conway
```

However, this didn't work so smoothly when we tried it on a machine running Ubuntu 16.04.


# Installing on Ubuntu 16.04

The package originally had instructions to build, install, and run the package using Cabal; however, we found these did not work reliably. 

So we built and executed with Stack, though we had to *turn off Nix* to do this on the Ubuntu machine:

```shell
$ stack build --no-nix
$ stack exec --no-nix -- conway
```

It should pop open a new window with the game running inside it.

You may have an error message about a missing native dependency on Ubuntu. If that's the case, try the following:

```shell
$ sudo apt-get install freeglut3 freeglut3-dev
```

We have not tested this on machines running Windows or OSX.

# Changing Colors

The original package only had a few colors enabled. For the purposes of making the header image on [The Haskell Museum](https://typeclasses.com/haskell-museum), we added some new colors to the Graphics.hs module, using `GLFloat` numbers, and exported those colors.
