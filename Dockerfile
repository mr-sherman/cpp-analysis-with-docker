FROM ubuntu
LABEL description="Container Build for C++ Applications"
RUN apt-get update && apt-get install -y g++ rsync zip make wget
#RUN wget https://github.com/github/codeql-cli-binaries/releases/download/v2.5.7/codeql-linux64.zip
#RUN unzip codeql-linux64
COPY HelloWorld /HelloWorld
COPY run_scan.sh /run_scan.sh
COPY run_hello.sh /run_hello.sh
WORKDIR /HelloWorld/
#RUN /codeql/codeql database create /helloworld-database/db-cpp --language=cpp --command='g++ -o HelloWorld2 helloworld2.cpp'
#RUN g++ -o HelloWorld2 helloworld2.cpp
#WORKDIR /
CMD ["/bin/sh", "/run_scan.sh"]
CMD ["/bin/sh", "/run_hello.sh"]


