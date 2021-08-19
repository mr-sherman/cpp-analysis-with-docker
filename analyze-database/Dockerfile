FROM ubuntu
LABEL description="Container Build for C++ Applications"
RUN apt-get update && apt-get install -y g++ rsync zip make wget
COPY run_scan.sh /run_scan.sh
WORKDIR /HelloWorld/
CMD ["/bin/sh", "/run_scan.sh"]


