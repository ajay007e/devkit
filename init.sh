#!/bin/bash

# Function to print ASCII logo
print_logo() {
    cat <<"EOF"
██████╗ ███████╗██╗   ██╗██╗  ██╗██╗████████╗
██╔══██╗██╔════╝██║   ██║██║ ██╔╝██║╚══██╔══╝
██║  ██║█████╗  ██║   ██║█████╔╝ ██║   ██║   
██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═██╗ ██║   ██║   
██████╔╝███████╗ ╚████╔╝ ██║  ██╗██║   ██║   
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝  ╚═╝╚═╝   ╚═╝   
                                             
EOF
}

# Clear the terminal
clear

# Print the logo
print_logo

# Exit immediately if a command exits with a non-zero status
set -e

# Run the OS detection script (make sure it's executable and in the same directory)
./detect-os.sh
