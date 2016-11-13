# gxkb_labels.pl

A simple program to create your custom labels for [gxkb](https://github.com/zen-tools/gxkb "gxkb")

# Install dependencies

## Debian

```bash
sudo apt-get install libimager-perl
```

## Others

```bash
cpanm --quiet --no-man-pages --notest --installdeps .
```

# Usage

```bash
# Backup existing images
mkdir ~/.local/share/gxkb/flags.orig/
cp -a ~/.local/share/gxkb/flags/* ~/.local/share/gxkb/flags.orig/

# Generate images in `labels/`
./gxkb_labels.pl

# Use generated images in `gxkb`
cp -a labels/* ~/.local/share/gxkb/flags/
```
Now try switching your layouts
