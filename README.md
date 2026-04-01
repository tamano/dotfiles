# dotfiles

Managed by [chezmoi](https://www.chezmoi.io/).

## Requirements

- [chezmoi](https://www.chezmoi.io/install/)
- [Homebrew](https://brew.sh/) (macOS) or dnf (AlmaLinux)

## Install (new machine)

```sh
# One-liner: install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tamano

# Or step by step:
chezmoi init tamano
chezmoi apply
```

## Usage

```sh
# See what would change
chezmoi diff

# Apply changes from repo to home
chezmoi apply

# Add a changed file back to the repo
chezmoi add ~/.some-config

# Edit a managed file (opens in $EDITOR, auto-applies)
chezmoi edit ~/.some-config

# Pull latest and apply
chezmoi update
```

## Structure

```
.
├── dot_*                          # $HOME/.* files
├── private_dot_config/            # $HOME/.config/
│   ├── nvim/
│   ├── gitui/
│   ├── starship.toml
│   └── wezterm/
├── dot_claude/                    # $HOME/.claude/
│   ├── settings.json.tmpl
│   └── statusline-command.sh
├── bin/                           # $HOME/bin/
├── run_once_before_*.sh(.tmpl)    # One-time setup scripts
├── .chezmoi.toml.tmpl             # chezmoi config (OS detection)
└── .chezmoiignore                 # Files to ignore during apply
```
