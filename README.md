# Inkd 🐙

Inkd is a command-line utility that attempts to coordinate themes
between all my most-used applications. Those applications are:

1. xorg
2. neovim
3. kitty (planned)
4. fish (planned)
5. gitui (planned)
6. plasma (planned)
7. gtk (planned)

Inkd strives to make things look nice together and provide a common
interface for setting the appearance of (most) things.

## Installation
Inkd requires Ruby >= 2.5.

For font-switching funcationality, optionally install [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
e.g. `brew install font-iosveka-nerd-font`

Then, install inkd via rubygems:
`$ gem install inkd`

## Usage

`$ ink colors one dark`

`$ ink colors one light`

`$ ink bars rounded`

`$ ink font iosevka`
