# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository containing personal development environment configurations. Each tool has its own directory with configuration files that are meant to be symlinked to the appropriate locations in the user's home directory.

## Repository Structure

```
.
├── git/
│   └── .gitconfig             # Git configuration
├── zsh/
│   ├── .zshenv                # Environment variables (Cargo, uv)
│   ├── .zprofile              # Login shell config (Homebrew, SSH agent, OrbStack)
│   └── .zshrc                 # Interactive shell config (Starship, Zinit, aliases)
├── solhint/
│   ├── .solhint.json          # Solidity linter configuration
│   └── README.md              # Solhint documentation
├── typescript-eslint/
│   ├── .eslintrc.json         # TypeScript ESLint configuration
│   └── README.md              # TypeScript ESLint documentation
├── .editorconfig              # Editor formatting rules
└── CLAUDE.md                  # This file
```

## Configuration Details

### Git Configuration (git/.gitconfig)

- Uses [delta](https://github.com/dandavison/delta) as pager with side-by-side diffs, line numbers, and decorations
- Default branch: `main`
- Pull strategy: fast-forward only (`ff = only`)
- Push: auto-setup remote tracking branches

### Zsh Configuration (zsh/)

Three files manage the shell environment with specific load order:

**`.zshenv`** - Environment variables (loaded first):
- Rust toolchain via `$HOME/.cargo/env`
- Python package manager uv: `$HOME/.local/bin`

**`.zprofile`** - Login shell configuration:
- Bitwarden SSH agent: `$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock`
- Homebrew initialization via `/opt/homebrew/bin/brew shellenv`
- OrbStack shell integration

**`.zshrc`** - Interactive shell configuration:
- **Prompt**: [Starship](https://starship.rs/) cross-shell prompt
- **Plugin manager**: [Zinit](https://github.com/zdharma-continuum/zinit) (not oh-my-zsh)
- **Zinit plugins**:
  - `fast-syntax-highlighting` - syntax highlighting
  - `zsh-autosuggestions` - fish-like autosuggestions
  - `zsh-completions` - additional completions
- **Editor**: Helix (`hx`) for local, `vim` for SSH (via `$EDITOR` and `$VISUAL`)
- **pnpm**: `$HOME/Library/pnpm` added to PATH
- **Modern CLI tool aliases**:
  - `vim` → `hx` (Helix editor)
  - `cat` → `bat --paging=never --style="changes"`
  - `diff` → `delta`
  - `find` → `fd`
  - `ls` → `eza`
  - `tree` → `eza --tree --git-ignore`
  - `ps` → `procs`
  - `htop` → `btm --basic` (bottom)
  - `grep` → `rg` (ripgrep)

### EditorConfig (.editorconfig)

- **JavaScript/TypeScript/JSON**: 2 spaces
- **Solidity**: 4 spaces
- **Git config files**: tabs with 4-space width
- LF line endings, UTF-8, trailing whitespace trimmed

### Solhint Configuration (solhint/.solhint.json)

Extends `solhint:recommended` with customizations:
- Payable fallback functions required
- Revert reason strings max 32 characters
- Private variables must use leading underscore (strict mode)
- Compiler version check disabled

See `solhint/README.md` for details.

### TypeScript ESLint (typescript-eslint/.eslintrc.json)

- **Base config**: `airbnb-typescript/base`
- **Parser**: `@typescript-eslint/parser` with tsconfig.json project reference
- **Plugins**: `@typescript-eslint`, `import`
- **Target**: TypeScript files (`.ts`) only
- Disables `import/no-extraneous-dependencies` check

See `typescript-eslint/README.md` for required dependencies.

## Installation Dependencies

The configurations assume these tools are installed via Homebrew (macOS):

**Text editor**:
- helix

**Modern CLI replacements**:
- bat, git-delta, fd, eza, ripgrep, procs, bottom

**Shell tools**:
- starship (prompt)
- zinit (auto-installed by .zshrc)

**Package managers**:
- pnpm (Node.js package manager)

**Other toolchains**:
- Rust toolchain (via rustup)
- uv (Python package manager)

**Optional tools**:
- Bitwarden (for SSH agent integration)
- OrbStack (Docker Desktop alternative)

## Modification Guidelines

When modifying configurations:
- Maintain the directory structure (tool-specific folders)
- Follow EditorConfig indentation rules for each file type
- **Zsh load order**: `.zshenv` → `.zprofile` → `.zshrc`
- Git config uses tabs; other configs typically use spaces
- Test zsh config changes don't break Zinit plugin loading or tool integrations
- Keep sensitive data (SSH keys, API tokens) out of version control

## Important Notes

- **NOT using oh-my-zsh** - uses Starship + Zinit instead
- **NOT using neovim** - uses Helix (`hx`) as primary editor
- Zinit auto-installs itself on first run if not present
- CLI tool aliases shadow original commands (e.g., `vim` actually runs `hx`)
