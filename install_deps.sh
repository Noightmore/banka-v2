#!/bin/bash

# Install dependencies for the project
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # get the id of the operating system
    os_id=$(cat /etc/os-release | grep ^ID= | cut -d '=' -f 2)
    if [[ "$os_id" == "Ubuntu" ]]; then
      echo "we are in ubuntu yay"
      install_deps
    else
      echo "Your distro - $os_id - is sadly not supported and we are very sorry :("
    fi
elif [[ "$OSTYPE" == "win32"* ]]; then
    echo "Windows is not supported"
fi

function install_deps()
{
  # install dependencies
  echo "Installing dependencies"
  sudo apt update
  sudo apt install -y apache2
}