FROM ubuntu:latest

#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
#RUN echo "Europe/Amsterdam" | tee /etc/timezone

RUN apt-get update && apt-get install -y apache2 ntpdate \
    apt autoremove && apt clean

RUN ntpdate -s time.nist.gov

# copy cgi scripts and the server configuration using an installation script
RUN  chmod +x ./install_scripts/install_cgi_script.sh \
     ./install_scripts/install_cgi_script.sh

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

