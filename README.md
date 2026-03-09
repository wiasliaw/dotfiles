# dotfiles

Personal development environment configurations for macOS.

## Prerequisites

### Required Tools

```bash
# Homebrew (should be installed first)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Text editor
brew install helix

# Modern CLI replacements
brew install bat git-delta fd eza ripgrep procs bottom

# Shell prompt
brew install starship

# Node.js package manager
brew install pnpm

# Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Python package manager (uv)
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Optional Tools

- [Bitwarden](https://bitwarden.com/) - SSH agent integration
- [OrbStack](https://orbstack.dev/) - Docker Desktop alternative for macOS

## Configuration Details

### Git

- **Pager**: [delta](https://github.com/dandavison/delta) with side-by-side diffs
- **Default branch**: `main`
- **Pull strategy**: fast-forward only
- **Push**: auto-setup remote tracking branches

### Zsh

Three files manage the shell environment:

**`.zshenv`** - Environment variables (loaded first):
- Rust toolchain (`cargo`)
- Python package manager (`uv`)

**`.zprofile`** - Login shell configuration:
- Homebrew initialization
- Bitwarden SSH agent
- OrbStack integration

**`.zshrc`** - Interactive shell configuration:
- **Prompt**: [Starship](https://starship.rs/) - cross-shell prompt
- **Plugin manager**: [Zinit](https://github.com/zdharma-continuum/zinit) with plugins:
  - `fast-syntax-highlighting` - syntax highlighting
  - `zsh-autosuggestions` - fish-like autosuggestions
  - `zsh-completions` - additional completions
- **Editor**: Helix (`hx`) for local, `vim` for SSH
- **Node.js**: pnpm package manager
- **Modern CLI replacements**:
  - `vim` → `hx` (Helix)
  - `cat` → `bat` (with syntax highlighting)
  - `diff` → `delta` (side-by-side diffs)
  - `find` → `fd` (fast file search)
  - `ls` → `eza` (modern ls)
  - `tree` → `eza --tree` (tree view)
  - `ps` → `procs` (modern process viewer)
  - `htop` → `btm` (bottom - system monitor)
  - `grep` → `rg` (ripgrep)

### EditorConfig

Consistent formatting rules across editors:
- **JavaScript/TypeScript/JSON**: 2 spaces
- **Solidity**: 4 spaces
- **Git config**: tabs (4-space width)
- UTF-8 encoding, LF line endings

## Customization

Feel free to modify these configurations to suit your workflow. When making changes:
- Maintain the directory structure (tool-specific folders)
- Follow EditorConfig indentation rules for each file type
- **Zsh files**: understand the load order (`.zshenv` → `.zprofile` → `.zshrc`)
- Test shell configuration changes don't break tool integrations
- Keep sensitive data (SSH keys, API tokens) out of version control

## License

MIT
