#!/bin/bash

function configure_apache_ubuntu()
{
  # configure apache
  echo "Configuring apache"
  sudo a2enmod cgi
  sudo mkdir -p /usr/lib/cgi-bin/
  sudo cp ./build/index.cgi /usr/lib/cgi-bin/
  sudo chmod +x /usr/lib/cgi-bin/index.cgi
  sudo mkdir -p /etc/apache2/conf.d/
  sudo cp ./server_configs/ubuntu_apache.conf /etc/apache2/conf.d/
  sudo service apache2 restart
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # shellcheck disable=SC2002
    os_id=$(cat /etc/os-release | grep ^ID= | cut -d '=' -f 2)
    if [[ "$os_id" == "ubuntu" ]]; then
      echo "we are in ubuntu yay"
      configure_apache_ubuntu
    else
      echo "Your cool distro - $os_id - is sadly not supported yet and we are very sorry :("
    fi
elif [[ "$OSTYPE" == "win32"* ]]; then
    echo "Windows is not supported"
fi