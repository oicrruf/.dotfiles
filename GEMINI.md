# GEMINI.md - Terminal Config & Dotfiles

A modular and professional Zsh configuration environment optimized for MacOS development, focusing on backend (Java/Node), infrastructure (Docker/K8s), and productivity tools.

## 🚀 Project Overview

This project provides a complete terminal setup for MacOS using Zsh, Oh My Zsh, and Powerlevel10k. It adopts a modular architecture to manage environment variables, aliases, and tool-specific configurations.

-   **Main Technologies:** Zsh, Oh My Zsh, Homebrew, Powerlevel10k, Rust-based CLI tools (eza, bat, yazi, zoxide), Window Management (yabai, skhd).
-   **Architecture:**
    -   `config/`: Configuration files for external tools like `yabai` and `skhd`.
    -   `dotfiles/`: Core configuration files (`zshrc`, `p10k.zsh`, `zshenv`, `fzf.zsh`) that are symlinked to the user's home directory.
    -   `modules/`: Functional sub-directories (symlinked to `~/.zsh_modules`) containing `.zsh` files that are automatically sourced by `zshrc`.
    -   `install.sh`: A multi-language (EN/ES) installation script that automates the setup process.

## 🛠️ Building and Running

The project is initialized via a central installation script:

```bash
# To install the environment
chmod +x install.sh
./install.sh
```

### Key Commands and Aliases
-   `ll`, `ls`, `lg`: Modern file listing using `eza`.
-   `cat`: Syntax-highlighted output using `bat`.
-   `y`: Fast terminal file manager (`yazi`).
-   `z`: Smart directory jumping (`zoxide`).
-   `top`: Interactive resource monitor (`btop`).
-   `gclean`: Helper to prune merged Git branches.
-   `curlj`: Colorized JSON curl output via `jq`.

## 📂 Project Structure

-   `dotfiles/`: Base configuration files.
-   `config/`:
    -   `yabai/`: Tiling window manager configuration (`yabairc`).
    -   `skhd/`: Hotkey daemon configuration (`skhdrc`).
-   `modules/`:
    -   `docker/`: Docker and Kubernetes integration.
        -   `lzd`: Alias for `lazydocker`.
        -   `k`/`kubectl`: Aliased to `kubecolor` for colored output.
        -   `k9s`: Interactive terminal UI for Kubernetes.
        -   `DOCKER_HOST`: Configured for Colima `default` profile. Use `docker-switch-k8s` / `docker-switch-default` to switch contexts.
        -   `docker-up` / `docker-down` / `docker-status`: Manage Colima default profile. `k8s-up` starts Colima with Kubernetes.
        -   **Colima** runs as a system service (`brew services start colima`) and auto-starts on login with the `default` profile (2 CPU / 2GB RAM / 20GB disk).
    -   `git/`: Git-specific utilities like `gclean`.
    -   `lang/`: Configuration for programming languages.
        -   **Java:** JDK 21 via Homebrew.
        -   **NVM:** Node Version Manager initialization.
        -   **Gemini:** Placeholder for `GEMINI_API_KEY`.
    -   `network/`: Network utilities.
        -   `myip`: Public IP.
        -   `localip`: Local IP on `en0`.
        -   `dig`: Aliased to `dog`.
        -   `vpn-mh`/`vpn-off`: VPN management scripts.
    -   `shell/`: Core productivity aliases (e.g., `eza`, `bat`, `yazi`) and plugins.
    -   `theme/`: Powerlevel10k theme loading and initialization.
-   `i18n/`: Internationalization messages for the installer.
-   `Brewfile`: Comprehensive list of CLI tools and Casks managed via Homebrew.

## 💻 Development Conventions

-   **Modular Extensions:** To add new functionality, create a `.zsh` file within the appropriate `modules/` subdirectory. These are sourced automatically in alphabetical order.
-   **Environment Variables:**
    -   Global paths (like `uv`) are defined in `zshenv`.
    -   Tool-specific paths and keys (like `JAVA_HOME` or `NVM_DIR`) are defined in `modules/lang/lang.zsh`.
-   **Secrets Management:** Sensitive information should be stored in `~/.env`. The installer initializes this from `.env.example`.
-   **Dependency Management:** All system dependencies should be declared in the `Brewfile` to ensure consistent environments across machines.

