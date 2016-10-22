# gen-flags

A simple program to create your custom flags for [gxkb](https://github.com/zen-tools/gxkb "gxkb")

# Install dependencies

## Debian

```bash
sudo apt-get install libimager-perl
```

## Others

```bash
cpanm --quiet --no-man-pages --notest --installdeps .
```

## Usage

```bash
./gen-flags
mkdir ~/.local/share/gxkb/flags.orig/
cp -ar flags/* ~/.local/share/gxkb/flags/
```
Now try switching your layouts
