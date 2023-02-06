# About

This is a custom Gentoo overlay. It provides ebuilds for the following packages

- `net-im/viber-9999` (viber version: 13.3.1)

# How to use

1. [Install layman](https://wiki.gentoo.org/wiki/Layman)

2. Install the ovelay

```bash
layman -a danailster-overlay -o https://raw.githubusercontent.com/danail-branekov/danailster-overlay/master/repositories.xml -f
```

3. Install overlay packages, for example

```bash
sudo emerge viber
```

# Useful stuff

## Viber

On large screens viber fonts are way too small for me. There are bunch of
threads on the internet suggesting using various QT environment variables (such
as `QT_SCALE_FACTOR` or `QT_AUTO_SCREEN_SCALE_FACTOR`) which used to work but
nowadays seem to have no effect.

What I have found to work for me (on 06.02.2023) to increase the font size (and
UI in general) is to use the `QT_SCREEN_SCALE_FACTORS` environment variable,
e.g.

``` QT_SCREEN_SCALE_FACTORS=1.5 /opt/viber/viber ```

Shout out to https://github.com/s-n-g/scale-viber for the tip!
