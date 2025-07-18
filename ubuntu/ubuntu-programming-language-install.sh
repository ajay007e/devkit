#!/bin/bash

animate_progress " Checking C/C++"
install_packages build-essential
version=$(gcc --version | head -n 1)
echo "📦 GCC version: $version"

animate_progress " Checking Python"
install_packages python3
version=$(python3 --version 2>&1)
echo "📦 Python is installed: $version"
# TODO: pip, venv installation

animate_progress " Checking Java"
install_packages default-jdk
version=$(java -version 2>&1 | head -n 1)
echo "📦 Java version: $version"
# TODO: update-alternatives, multiple java version installation

animate_progress "󰎙 Checking NodeJs"
install_packages nodejs
version=$(node -v)
echo "📦 Node.js version: $version"
# TODO: npm, nvm installation

animate_progress " Checking MySQL"
install_packages mysql-server
version=$(mysql --version)
echo "📦 MySQL version: $version"

animate_progress " Checking MongoDB"

if ! command -v mongod &>/dev/null; then
    install_packages gnupg
    cmd='curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor'
    watch_execution "" bash -c "$cmd"
    DISTRO_CODENAME=$(lsb_release -c -s 2>/dev/null)
    cmd="echo \"deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $DISTRO_CODENAME/mongodb-org/8.0 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list"
    watch_execution "" bash -c "$cmd"
    watch_execution "" sudo apt-get update
    install_packages mongodb-org
fi
version=$(mongod --version | head -n 1)
echo "📦 MongoDB version: $version"
