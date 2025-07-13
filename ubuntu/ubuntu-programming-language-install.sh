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

# TODO: special installation
# animate_progress "Checking MongoDB"
# install_packages mongodb-org
# version=$(mongod --version | head -n 1)
# echo "📦 MongoDB version: $version"
