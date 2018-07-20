# cbr-docker-ohie
Dockerization of the OpenMRS instances hosting the casereport module,
DHIS2, OpenHIM, OpenEMPI, OpenSHR and DHIS2 for case based surveillance.

#### Requirements
- Docker 17+
- Git

#### Install Docker
Install docker for Ubuntu Trusty 14.04 following the instructions 
[here](https://docs.docker.com/install/linux/docker-ce/ubuntu/), 
make sure under the section labeled **EXTRA STEPS FOR AUFS** 
you select the Trusty 14.04 tab. It's recommended to use the **Install using the repository** option rather than from packages.

#### Install git
Your Ubuntu installation should come with git already pre installed, if not, 
run the commands below to install it

```
sudo apt-get update
sudo apt-get install git
```

#### Import the project
Create a new directory where to import to the code, switch to the new directory and
then run the command below to import the project

```
git clone https://github.com/wluyima/cbr-docker-ohie.git
```

#### Run the ecosystem
In the terminal, navigate to the directory you just created above and
execute the command below

```
docker stack deploy -c docker-compose.yml cbr
```

#### Shutdown the ecosystem
In the terminal, navigate to the directory you just created above and
execute the command below, note that the command resets all the systems which would
lead to loss of all data in the databases.

```
docker stack rm cbr
```

 
