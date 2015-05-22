# config

## One line install

```
curl -L http://git.io/vJN8r | sh
# or
wget -qO- http://git.io/vJN8r | sh
```

## Bash Aliases

```bash
ln -sf $(pwd)/.bash_aliases ~/
ln -sf $(pwd)/.alias.d/ ~/
ln -sf $(pwd)/bin ~/
```

## Apps Config

```bash
ln -sf $(pwd)/terminator ~/.config/
```

## Git

```bash
ln -sf $(pwd)/git/.gitalias ~/
ln -sf $(pwd)/git/.giturl ~/
git config --global --replace-all include.path "~/.gitalias" "~/.gitalias"
```
