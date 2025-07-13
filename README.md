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
├── init.sh                                # Entry point script to start setup
├── detect-os.sh                           # Detects the OS type (e.g., Ubuntu)
├── packages.conf                          # Central configuration for packages
├── LICENSE
├── README.md
├── gnome/                                 # GNOME desktop environment setup
│   ├── gnome-extensions.sh                # Installs GNOME Shell extensions
│   ├── gnome-hotkeys.sh                   # Configures GNOME hotkeys
│   ├── gnome-settings.dconf               # GNOME settings export/import file
│   └── gnome-setttings.sh                 # Applies GNOME settings via dconf
└── ubuntu/                                # Ubuntu-specific setup scripts
    ├── ubuntu.sh                          # Main Ubuntu setup script
    ├── ubuntu-util.sh                     # Helper functions for Ubuntu scripts
    ├── ubuntu-programming-language-install.sh  # Installs dev tools (Python, Node.js, etc.)
    └── ubuntu-external-packages.sh        # Installs external packages and PPAs
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
   git clone https://github.com/ajay007e/devkit.git
   cd devkit
   ```

2. **Run the main setup script:**

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
