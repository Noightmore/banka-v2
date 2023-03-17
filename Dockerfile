FROM ubuntu:latest

#RUN set -ex ; \
#    echo "nameserver 8.8.8.8" > /etc/resolv.conf
#RUN set -ex ; \
#    echo "Europe/Amsterdam" | tee /etc/timezone

RUN set -ex ; \
    apt-get update && apt-get install -y apache2 ntpdate ; \
    apt autoremove && apt clean

#RUN set -ex ; \
#    ntpdate -s time.nist.gov

RUN set -ex ; \
    pwd

# copy cgi scripts and the server configuration using an installation script
RUN  set -x ; \
     chmod +x ./install_scripts/install_cgi_script.sh ; \
     ./install_scripts/install_cgi_script.sh

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

