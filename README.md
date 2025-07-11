```
██████╗ ███████╗██╗   ██╗██╗  ██╗██╗████████╗
██╔══██╗██╔════╝██║   ██║██║ ██╔╝██║╚══██╔══╝
██║  ██║█████╗  ██║   ██║█████╔╝ ██║   ██║   
██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═██╗ ██║   ██║   
██████╔╝███████╗ ╚████╔╝ ██║  ██╗██║   ██║   
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝  ╚═╝╚═╝   ╚═╝   
```

# 🛠️ Ubuntu Desktop Setup Automation

This repository automates the configuration of a new Ubuntu desktop environment. It installs your preferred applications, sets up GNOME settings, enables useful extensions, and ensures system preferences are consistent across installs.

---

## 📂 Directory Structure

```
.
├── detect-os.sh              # Detects and validates supported OS (Ubuntu)
├── init.sh                   # Entry point for setting up the system
├── packages.conf             # Central config file for app and package lists

├── gnome/
│   ├── gnome-extension.sh    # Installs GNOME extensions
│   ├── gnome-hotkeys.sh      # Sets custom keyboard shortcuts
│   ├── gnome-settings.dconf  # GNOME settings dump (imported by script)
│   └── gnome-settings.sh     # Loads GNOME settings from .dconf

├── ubuntu/
│   ├── ubuntu-ext-packages.sh # Adds external repos (Chrome, Spotify, etc.)
│   ├── ubuntu-util.sh         # Utility functions for Ubuntu environment
│   └── ubuntu.sh              # Base Ubuntu setup (apt update, essential tools)
```

---

## 🚀 Features

- ✅ OS detection and verification
- 🎨 GNOME customization (shortcuts, extensions, appearance)
- 🌐 Adds and installs external packages (Chrome, Discord, Spotify, etc.)
- 📦 Installs common dev tools and desktop applications
- 🧩 Modular: each part of the setup is independently maintainable

---

## 📦 Applications & Tools

This setup includes:

- Google Chrome
- Discord
- Spotify
- GNOME Tweaks and Extensions
- Essential Ubuntu packages (`curl`, `git`, etc.)

You can control which packages to install by editing `packages.conf`.

---

## 📝 Usage

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/ubuntu-desktop-setup.git
   cd ubuntu-desktop-setup
   ```

2. **Make scripts executable (optional):**

   ```bash
   chmod +x init.sh
   ```

3. **Run the main setup script:**

   ```bash
   ./init.sh
   ```

---

## 🧩 Modular Scripts

You can run parts of the setup independently:

```bash
./ubuntu/ubuntu.sh              # Ubuntu base setup
./ubuntu/ubuntu-ext-packages.sh # Install Chrome, Spotify, etc.
./gnome/gnome-settings.sh       # Apply GNOME settings
./gnome/gnome-hotkeys.sh        # Set GNOME hotkeys
./gnome/gnome-extension.sh      # Enable extensions
```

---

## 🔧 Customization

- Modify `packages.conf` to add/remove packages.
- Replace `gnome-settings.dconf` with your exported GNOME settings:
  ```bash
  dconf dump / > gnome/gnome-settings.dconf
  ```

---

## 🧰 Prerequisites

- Ubuntu 22.04+ (GNOME-based)
- Sudo privileges
- Internet connection

---

## 📄 License

MIT License – see [`LICENSE`](LICENSE)

---

## 🤝 Contributions

Issues and PRs are welcome! Feel free to fork and make it your own.
