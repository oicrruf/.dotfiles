# 💻 Terminal Config & Dotfiles

Este repositorio contiene mi configuración personal de terminal, optimizada para productividad con IA, desarrollo backend (Java/Node) y gestión de infraestructura (Docker/K8s).

## 🚀 Instalación Rápida

Para configurar todo en una máquina nueva con MacOS:

```bash
git clone <este-repo> ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

---

## 🛠️ Herramientas de Homebrew (CLI & Apps)

Estas son las aplicaciones principales que gestiona el instalador a través de `brew`:

### Productividad y Navegación
*   **[eza](https://github.com/eza-community/eza):** Reemplazo moderno de `ls` con iconos y colores (alias `ll`, `ls`, `lg`).
*   **[bat](https://github.com/sharkdp/bat):** Un `cat` con esteroides que añade resaltado de sintaxis (alias `cat`).
*   **[yazi](https://github.com/sxyazi/yazi):** Gestor de archivos para terminal extremadamente rápido (comando `y`).
*   **[fzf](https://github.com/junegunn/fzf):** Buscador borroso (fuzzy finder).
*   **[zoxide](https://github.com/ajeetdsouza/zoxide):** Un comando `cd` inteligente que aprende de tus hábitos (`z`).
*   **[tldr](https://tldr.sh/):** Ejemplos prácticos de comandos en lugar de manuales densos (alias `help`).
*   **[btop](https://github.com/aristocratos/btop):** Monitor de recursos (CPU, RAM, Red) visual y moderno (alias `top`).
*   **[duf](https://github.com/muesli/duf):** Uso de disco con tablas legibles (alias `df`).

### Desarrollo e Infraestructura
*   **[lazydocker](https://github.com/jesseduffield/lazydocker):** Interfaz TUI para gestionar Docker (alias `lzd`).
*   **[neovim](https://neovim.io/):** Editor de texto extensible (alias `vim`).
*   **[Colima](https://github.com/abiosoft/colima):** Runtime ligero para contenedores y Kubernetes. Configurado como servicio del sistema (inicia automáticamente al arrancar) con el perfil `default` (2 CPU / 2GB RAM / 20GB disco).

---

## 🐚 Módulos de Zsh (Personalización)

La configuración se divide en módulos dentro de `~/.zsh_modules/`:

| Módulo | Función |
| :--- | :--- |
| `env.zsh` | Variables de entorno para Java (JDK 21) y NVM. |
| `theme.zsh` | Integración de **Powerlevel10k** para una terminal visual. |
| `tools.zsh` | Núcleo de la configuración: alias modernos, utilidades de red y Git. |

---

## 🔑 Funciones e IA

*   **Gemini CLI:**
    *   `ask-gemini "pregunta"`: Consulta rápida a Gemini 1.5 Flash.
    *   `gemini-file <archivo> "pregunta"`: Envía archivos completos para análisis.
*   **Red:** `myip` (IP pública) y `localip` (IP privada).
*   **Git:** `gclean` para borrar ramas locales ya fusionadas.
*   **Utilidades:** `curlj` para peticiones JSON coloreadas con `jq`.

---

## 🔒 Seguridad y Configuración Final

El sistema utiliza un archivo `~/.env` para gestionar claves de API de forma segura.
1. El archivo `.env` en la raíz está en el `.gitignore` para evitar fugas.
2. El instalador inicializa este archivo desde `.env.example`.
