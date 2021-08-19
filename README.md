# cpp-analysis-with-docker
A solution to analyzing C++ repos with CodeQL and docker

Typically, executing CodeQL Scans from docker containers that execute builds involves downloading the CodeQL bundle from the docker file.  This can come with disadvantages as it may have to pull > 250MB and unpack a .zip file.  It can complicate versioning of codeql databases if you're always puling the latest bundle.  It doesn't allow you to separate the CodeQL query execution from builds and testing.  

This demonstrates the use of bindmounting directories so that the codeQL CLI can be stored in one shared directory and the resulting database can be stored in another.  An separate container that does the analysis can then use those same directories in another container.  

To set it up, clone this repo.

Then wget the codeQL linux bundle - it has to be the linux bundle:
```
wget https://github.com/github/codeql-cli-binaries/releases/download/v2.5.7/codeql-linux64.zip
unzip codeql-linux64.zip
```


Then:
```
mkdir databases
mkdir output
```

Build the docker container:
```
cd create-database
docker build -t scan0 .
cd ..
cd analyze-database
docker build -t scan1 .
```

Finally:
```
chmod +x create-database/docker_run.sh
chmod +x analyze-database/docker_run.sh
chmod +x run_all.sh
./run_all.sh
```

Once it's complete, you can see the database in the ./databases directory and the sarif file in the output directory
You will have to delete the resulting database for subsequent runs as they use the same name.

