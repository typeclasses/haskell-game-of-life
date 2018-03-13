Two versions of Conway's game of Life. One is a fairly standard version, the
other is very slow, but specified in an interesting way. The slow version is found in LifeSlow.hs.

# Build with Nix

Our primary computers all run NixOS, and the following instructions worked for us on those. Note that Nix is enabled in our Stack configuration and we have Nix installing some native dependencies for us.

```haskell
$ stack build
$ stack exec -- conway
```

However, this didn't work so smoothly when we tried it on a machine running Ubuntu 16.04.


# Installing on Ubuntu 16.04

This was included in the original instructions from the package author, but it didn't work for us:

> To build, use Cabal:
`$ cabal configure`
`$ cabal build`


However, on a machine running Ubuntu 16.04, the following did work:

> If you want to install:
`$ cabal install`

> Or just run it:
`$ ./dist/build/conway/conway`

Alternatively you can build and run it with Stack, though we had to *turn off Nix* to do this on the Ubuntu machine:

`$ stack build --no-nix`
`$ stack exec --no-nix -- conway`

It should pop open a new window with the game running inside it.

You may have an error message about a missing native dependency on Ubuntu. If that's the case, try the following:

`$ sudo apt-get install freeglut3 freeglut3-dev`

We have not tested this on machines running Windows or OSX.

# Changing Colors

The original package only had a few colors enabled. For the purposes of making the header image on [The Haskell Museum](https://typeclasses.com/haskell-museum), we added some new colors to the Graphics.hs module, using `GLFloat` numbers, and exported those colors.
