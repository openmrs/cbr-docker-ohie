# cbr-docker-ohie
Dockerization of 2 OpenMRS instances hosting the casereport module,
DHIS2, OpenHIM, OpenEMPI, OpenSHR and DHIS2 for case based surveillance.

#### Requirements
- Docker 17+
- Git

#### Install Docker
Install docker for your OS platform following the instructions
[here](https://docs.docker.com/install/#supported-platforms).

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

#### Startup
From the commandline, navigate to the directory you just created above and
execute the command below

```
docker stack deploy -c docker-compose.yml cbr
```


#### Shutdown
From the commandline, navigate to the directory you just created above and
execute the command below, note that the command resets all the systems
which would lead to loss of all data in the databases.

```
docker stack rm cbr
```

#### Accessing the systems
If you have installed the ecosystem on a remote machine, you will need to
replace **localhost** in the URLs below with the IP address of the machine.
If you plan to access the OpenHIM instance, you will need to edit the file
named **console-config.json** inside the **openhim** folder and set the
value of the **host** field to the IP address of the remote machine.

Below are URLs to visit to access each system,

OpenMRS Instance 1 - http://localhost:8080/openmrs

OpenMRS Instance 2 - http://localhost:8081/openmrs

OpenEMPI - http://localhost:8082/openempi-admin

OpenSHR - http://localhost:8083/openmrs

DHIS2 - http://localhost:8084

OpenHIM - http://localhost

#### Testing the ecosystem

After successfully installing the ecosystem, you should be able to visit
any of the OpenMRS instances (http://localhost:8080/openmrs or http://localhost:8081/openmrs),
register a new patient, add a **New HIV Case** report item for the patient
and then submit it.

The patient should automatically get enrolled in the **HIV surveillance Program**
in the DHIS2 instance at http://localhost:8084. To view the enrollment, you will
need to go to the tracker capture app and select the org unit mapped to the
OpenMRS instance from which you submitted the case report.
 
