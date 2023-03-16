#!/bin/bash

function configure_apache_ubuntu()
{
  # configure apache
  echo "Configuring apache"
  sudo a2enmod cgi
  sudo mkdir -p /var/www/localhost/cgi-bin
  sudo cp  ./index.cgi /var/www/localhost/cgi-bin
  sudo chmod a+x /var/www/localhost/cgi-bin/index.cgi
  sudo cp ../server_configs/httpd.conf /etc/apache2/
  sudo systemctl restart apache2 # hopefully nobody installs any other init system on ubuntu
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # shellcheck disable=SC2002
    os_id=$(cat /etc/os-release | grep ^ID= | cut -d '=' -f 2)
    if [[ "$os_id" == "ubuntu" ]]; then
      echo "we are in ubuntu yay"
      onfigure_apache_ubuntu
    else
      echo "Your cool distro - $os_id - is sadly not supported yet and we are very sorry :("
    fi
elif [[ "$OSTYPE" == "win32"* ]]; then
    echo "Windows is not supported"
fi