FROM ubuntu:latest

#RUN set -ex ; \
#    echo "nameserver 8.8.8.8" > /etc/resolv.conf
#RUN set -ex ; \
#    echo "Europe/Amsterdam" | tee /etc/timezone

RUN set -ex ; \
    apt-get update && apt-get install -y apache2 apache2-utils ntpdate ; \
    apt autoremove && apt clean

#RUN set -ex ; \
#    ntpdate -s time.nist.gov

#RUN set -ex ; \
#    pwd ; \
#    ls -la

# copy the install script folder and built cgi script to the docker file

# copy cgi scripts and the server configuration using an installation script
#RUN  set -x ; \
#     chmod +x ./install_scripts/install_cgi_script.sh ; \
#     ./install_scripts/install_cgi_script.sh

RUN a2enmod cgi
RUN mkdir -p /usr/lib/cgi-bin/
COPY build/index.cgi /usr/lib/cgi-bin/
RUN chmod +x /usr/lib/cgi-bin/index.cgi
RUN mkdir -p /etc/apache2/conf.d/
COPY server_configs/ubuntu_apache.conf /etc/apache2/conf.d/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
#CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

