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

#### Running the ecosystem
In the terminal, navigate to the directory you just created above and
execute the command below

```
docker stack deploy -c docker-compose.yml cbr
```

#### Accessing the systems
If you have installed the ecosystem on a remote machine, you will need to
replace **localhost** in the URLs below with the IP address of the machine.
If you plan to access the OpenHIM instance, you will need to edit the file named
**console-config.json** inside the **openhim** folder and set the host
field to the IP address of the remote machine.

Below are URLs to visit to access each system,

OpenMRS Instance 1 - http://localhost:8080/openmrs

OpenMRS Instance 2 - http://localhost:8081/openmrs

OpenEMPI - http://localhost:8082/openempi-admin

OpenSHR - http://localhost:8083/openmrs

DHIS2 - http://localhost:8084

OpenHIM - http://localhost

#### Shutting down the ecosystem
In the terminal, navigate to the directory you just created above and
execute the command below, note that the command resets all the systems
which would lead to loss of all data in the databases.

```
docker stack rm cbr
```


#### Testing the ecosystem

After successfully installing the ecosystem, you should be able to visit
any of the OpenMRS instances (http://localhost:8080/openmrs or http://localhost:8081/openmrs),
register a new patient, add a **New HIV Case** report item for the patient
and then submit it.

The patient should automatically get enrolled in the **HIV surveillance Program**
in the DHIS2 instance at http://localhost:8084, you will need to go to the tracker
capture app and select the org unit mapped to the OpenMRS instance from which you
submitted the case report.
 
