About
================

This is a custom Gentoo overlay. It provides ebuilds for the following packages
* `net-im/viber-9999` (viber version: 10.3.0)

How to use
================
1. [Install layman](https://wiki.gentoo.org/wiki/Layman)

2. Install the ovelay

```bash
layman -a danailster-overlay -o https://raw.githubusercontent.com/danail-branekov/danailster-overlay/master/repositories.xml -f
```

3. Install overlay packages, for example
```bash
sudo emerge viber
```
