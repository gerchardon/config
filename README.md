# config

## Bash Aliases

```bash
ln -sf $(pwd)/.bash_aliases ~/
ln -sf $(pwd)/.alias.d/ ~/
ln -sf $(pwd)/bin ~/
```

## Apps Config

```bash
ln -sf $(pwd)/terminator ~/.config/
```

## Git

```bash
ln -sf $(pwd)/git/.gitalias ~/
git config --global --replace-all include.path "~/.gitalias" "~/.gitalias"
```

