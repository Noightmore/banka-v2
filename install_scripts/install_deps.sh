#!/bin/bash

function install_deps_ubuntu()
{
  # install dependencies
  echo "Installing dependencies"
#  sudo apt update
#  sudo apt upgrade -y
  sudo apt install -y apache2
}

# Install dependencies for the project
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # shellcheck disable=SC2002
    os_id=$(cat /etc/os-release | grep ^ID= | cut -d '=' -f 2)
    if [[ "$os_id" == "ubuntu" ]]; then
      echo "we are in ubuntu yay"
      install_deps_ubuntu
    else
      echo "Your distro - $os_id - is sadly not supported and we are very sorry :("
    fi
elif [[ "$OSTYPE" == "win32"* ]]; then
    echo "Windows is not supported"
fi

