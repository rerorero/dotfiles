#### installs

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install rbenv ruby-build nodenv python3 go golangci-lint gpg ghq peco

```

#### zsh

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

#### node

```
nodenv install 16.15.1
nodenv global 16.15.1
```

#### nvim

```
brew install --HEAD neovim
```

additionals

```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
python3 -m pip install --user --upgrade pynvim
```

and do `:PackerInstall`

#### git

- add gpg key to `~/.ssh/id_ed25519_github`
- set `.ssh/config`

```
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_ed25519_github
  User git
  UseKeychain yes
  AddKeysToAgent yes
```

#### Go

```
go install golang.org/x/tools/gopls@latest
```
