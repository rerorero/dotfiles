#### installs

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install rbenv ruby-build nodenv python3 go golangci-lint gpg ghq peco wget ripgrep watchman

```

#### Ubuntu
```
sudo locale-gen en_US.UTF-8
```

#### zsh

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

#### nvim

```
brew install --HEAD neovim
npm install neovim
gem install neovim environment
```

additionals

```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
python3 -m pip install --user --upgrade pynvim
```

and do `:PackerInstall`

#### git

- add ssh key to `~/.ssh/id_ed25519_github`
- set `.ssh/config`

```
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_ed25519_github
  User git
  UseKeychain yes
  AddKeysToAgent yes
```

- add gpg key

#### Go

```
go install golang.org/x/tools/gopls@latest
```

#### Ruby

```
rbenv install 2.7.6
rbenv global 2.7.6
gem install rubocop rake
```

For sorbet project

```
bundler add sorbet
bundle exec srb init
```
