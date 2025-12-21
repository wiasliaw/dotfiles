# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository containing personal development environment configurations. Each tool has its own directory with configuration files that are meant to be symlinked or copied to the appropriate locations in the user's home directory.

## Repository Structure

```
.
├── git/            # Git configuration
├── zsh/            # Zsh shell configuration
├── solhint/        # Solidity linter configuration
├── typescript-eslint/  # TypeScript/ESLint configuration
└── .editorconfig   # Editor formatting rules
```

## Configuration Details

### Git Configuration (git/.gitconfig)

- Uses [delta](https://github.com/dandavison/delta) as pager with side-by-side diffs, line numbers, and decorations
- Default branch: `main`
- Pull strategy: fast-forward only (`ff = only`)
- Push: auto-setup remote tracking branches

### Zsh Configuration (zsh/)

- **Shell framework**: oh-my-zsh with `agnoster` theme
- **Plugins**: `git`, `zsh-autosuggestions`
- **Tool integrations**:
  - Node Version Manager (NVM) loaded at startup
  - Rust toolchain (sources `$HOME/.cargo/env`)
  - Huff compiler path: `$HOME/.huff/bin`
- **Modern CLI replacements** (aliased):
  - `vim` → `nvim` (Neovim)
  - `cat` → `bat`
  - `diff` → `delta`
  - `find` → `fd`
- **Editor**: nvim for both local and SSH sessions

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

### TypeScript ESLint (typescript-eslint/.eslintrc.json)

- **Base config**: `airbnb-typescript/base`
- **Parser**: `@typescript-eslint/parser` with tsconfig.json project reference
- **Plugins**: `@typescript-eslint`, `import`
- Disables `import/no-extraneous-dependencies` check
- **Required dependencies** (not included in repo):
  - eslint, typescript
  - @typescript-eslint/parser, @typescript-eslint/eslint-plugin
  - eslint-config-airbnb-base, eslint-config-airbnb-typescript
  - eslint-plugin-import

## Installation Dependencies

The configurations assume these tools are installed via Homebrew (macOS):
- oh-my-zsh
- neovim
- bat
- delta
- fd
- nvm (Node Version Manager)
- Rust toolchain
- Huff compiler (for Ethereum development)

## Modification Guidelines

When modifying configurations:
- Maintain the directory structure (tool-specific folders)
- Follow EditorConfig indentation rules for each file type
- Git config uses tabs; other configs typically use spaces
- Test zsh config changes don't break oh-my-zsh or NVM initialization
