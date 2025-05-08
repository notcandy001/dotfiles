# notcandy Hyprland Dotfiles v1 — Beauty Beyond Human

Welcome to **notcandy's** Hyprland dotfiles: a fully customized, uniquely aesthetic Arch-based setup designed for elegance, speed, and seamless wallpaper-based theming.
“Make it look like it wasn’t made by a human — just born beautiful.”

This is more than just a configuration — it's a living system. Every file, every pixel, every script was crafted to reflect beauty, 
function, and originality. Proudly made by notcandy


---

## 🔮 Features

-  **Dynamic Theming** — Terminal (Kitty), Waybar, and notifications change color based on your wallpaper.
- **Wallpaper Engine** — Automatically applies themes, tints, and transitions using `swww` and custom scripts.
-  **Modular Structure** — Clean, extendable layout with `configs/`, `scripts/`, and `themes/`.
-  **Intelligent Install Script** — Smart `install.sh` links, installs, and configures everything — one command and done.
-  **Custom Welcome GUI** — Launches on first boot to guide users through initial setup.
-  **Mylinuxforwork-inspired keybinds** — Enhanced and improved for a smoother Hyprland experience.
-  **Package Awareness** — Waybar displays pacman update notifications and system info in style.
-  **Optimized for Performance** — Lightweight, fast, and responsive on modern setups.

---
Recommended is to install the Hyprland Desktop Profile from archinstall first.

```shell
bash <(curl -s https://raw.githubusercontent.com/notcandy001/dotfiles/refs/heads/master/install.sh)
```
## 📦 Requirements

- Arch Linux (or Arch-based)
- Hyprland (latest)
- Kitty terminal
- Waybar
- swww
- pywal
- rofi
- dunst
- jq
- Git

You can install them manually or let the installer handle it.

---

## 🚀 Installation

Clone and run the install script:

```bash
git clone https://github.com/notcandy001/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```
## keybindings

| Key Combo           | Action              |
| ------------------- | ------------------- |
| `Super + Enter`     | Launch Kitty        |
| `Super + D`         | Rofi launcher       |
| `Super + Q`         | Close window        |
| `Super + Shift + R` | Restart Hyprland    |
| `Super + E`         | Launch file manager |
| `Super + W`         | Wallpaper switch    |
