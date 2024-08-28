# hyp3rflow/ddotfiles

dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Install

This will install Homebrew and chezmoi. After installation `chezmoi` will be initialized.
  
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/stonechoe/ddotfiles/main/install.sh)"
```

## Manual install

Prerequisite: Homebrew & chezmoi

```shell
# Setup
chezmoi init https://github.com/stonechoe/ddotfiles.git

# Configure ~/.config/chezmoi/chezmoi.toml
chezmoi init
```