# 💻 Terminal Config & Dotfiles

A professional, AI-ready terminal configuration for MacOS, optimized for backend development (Java/Node), infrastructure (Docker/K8s), and productivity.

[Read this in Spanish (Español)](./README.es.md)

---

## 🚀 Quick Install

To set up everything on a fresh MacOS machine:

```bash
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

The installer will automatically detect your system language (EN/ES) for the setup process.

---

## 🛠️ Homebrew Tools (CLI & Apps)

This configuration manages modern, high-performance tools written in Rust and Go:

### Productivity & Navigation
*   **[eza](https://github.com/eza-community/eza):** Modern `ls` replacement with icons (aliases: `ll`, `ls`, `lg`).
*   **[bat](https://github.com/sharkdp/bat):** `cat` with syntax highlighting.
*   **[yazi](https://github.com/sxyazi/yazi):** Blazing fast terminal file manager (command: `y`).
*   **[fzf](https://github.com/junegunn/fzf):** Command-line fuzzy finder.
*   **[zoxide](https://github.com/ajeetdsouza/zoxide):** Smarter `cd` command (`z`).
*   **[tldr](https://tldr.sh/):** Practical command examples (alias: `help`).
*   **[btop](https://github.com/aristocratos/btop):** Interactive resource monitor (alias: `top`).

### Development & Infrastructure
*   **[lazydocker](https://github.com/jesseduffield/lazydocker):** Terminal UI for Docker management (alias: `lzd`).
*   **[direnv](https://direnv.net/):** Auto-load/unload environment variables on folder entry.
*   **[neovim](https://neovim.io/):** Extensible text editor (alias: `vim`).
*   **[Colima](https://github.com/abiosoft/colima):** Lightweight Docker & Kubernetes runtime. Configured as a system service (auto-starts on login) with the `default` profile (2 CPU / 2GB RAM / 20GB disk).

---

## 🐚 Zsh Modules (Customization)

The configuration is modular and located in `~/.zsh_modules/`:

| Module | Description |
| :--- | :--- |
| `env.zsh` | Environment variables for Java (JDK 21) and NVM. |
| `theme.zsh` | **Powerlevel10k** integration for a rich visual prompt. |
| `tools.zsh` | Core aliases, network utilities, and Git shortcuts. |

---

## 🔑 Features & IA

*   **Gemini CLI Integration:**
    *   `ask-gemini "query"`: Quick query to Gemini 1.5 Flash.
    *   `gemini-file <file> "query"`: Analyze full files with AI.
*   **Network:** `myip` (Public IP) and `localip` (Local IP).
*   **Git:** `gclean` to prune merged local branches.
*   **Utilities:** `curlj` for colorized JSON requests via `jq`.

---

## 🔒 Security

Secrets are managed via `~/.env`:
1. The `.env` file is git-ignored to prevent leaks.
2. **direnv** automatically loads secrets when entering a project folder (requires running `direnv allow` once).
