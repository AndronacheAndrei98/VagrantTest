FROM redhat/ubi9:latest
WORKDIR /usr/local/app
COPY catscript.sh ./
EXPOSE 8080
RUN yum install -y net-tools
RUN yum install -y nc
RUN chmod +x catscript.sh
CMD ["/usr/local/app/catscript.sh"]