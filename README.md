# cbr-docker-ohie
Dockerization of OpenHIM, OpenEMPI, OpenSHR, DHIS2, a simulator and 2 OpenMRS instances
each hosting the case report module to demonstrate case based surveillance.

> NOTE: **The images used for this demonstration are big** and use a lot of memory. Running the demonstration 
> may involve downloading over 6 gigabytes of Docker images and running the full stack can consume 
> 32 gigabytes of memory (though it can run with less memory). For this reason, consider running the 
> demonstration in the cloud. For example, [DigitalOcean](https://www.digitalocean.com/) can spin up 
> a large droplet (server) in a minute, provides a one-click with Docker pre-installed on Ubuntu, and 
> only charges a modest fee. For example, in the following demonstration video, 
> we spent 4¢ (USD $0.04) to run a 16-CPU 64 gigabyte server (much larger than necessary) for five minutes.

> NOTE: **This demonstration assumes all containers are on a single host**. While Docker swarm, by 
> design, allows you to run services across multiple nodes (servers), this demonstration defines 
> containers that bind to files/folders on the host, meaning the services are not portable to other 
> nodes (unless you made the effort to copy the source files to all nodes in your swarm).

[![Case Based Reporting OpenHIE Demo](http://img.youtube.com/vi/Gn71R9aRwgM/0.jpg)](http://www.youtube.com/watch?v=Gn71R9aRwgM)

### Requirements
- Docker 17+
- Git
- At least 8GB of RAM available to Docker

### Install Docker
Install docker for your platform following the instructions
[here](https://docs.docker.com/install/#supported-platforms).

### Install git
Your Ubuntu installation should come with git already pre installed, if not, 
run the commands below to install it

```
sudo apt-get update
sudo apt-get install git
```

### Import the project
Create a new directory into which to clone the code, switch to the new directory and
then run the command below to import the project

```
git clone https://github.com/wluyima/cbr-docker-ohie.git
```

### Startup
From the commandline, navigate to the directory you just created above and
execute the command below

```
docker stack deploy -c docker-compose.yml cbr
```

### Shutdown (Resetting)
From the commandline, navigate to the directory you just created above and
execute the command below, note that the command resets all the systems
which would lead to loss of all data in the databases.

```
docker stack rm cbr
```

### Accessing the instances
If you have installed the ecosystem on a remote machine, you will need to
replace **localhost** in the URLs below with the IP address of the machine.
If you plan to access the OpenHIM instance, you will need to edit the file
named **console-config.json** inside the **openhim** folder and set the
value of the **host** field to the IP address of the remote machine.

Below are URLs to visit to access each instance,

OpenMRS Instance 1 - http://localhost:8080/openmrs

OpenMRS Instance 2 - http://localhost:8081/openmrs

OpenEMPI - http://localhost:8082/openempi-admin

OpenSHR - http://localhost:8083/openmrs

DHIS2 - http://localhost:8084

OpenHIM - http://localhost

Simulator - http://localhost:81

### Testing the ecosystem

After successfully installing the ecosystem, you should be able to visit
any of the OpenMRS instances (http://localhost:8080/openmrs or http://localhost:8081/openmrs),
register a new patient, add a **New HIV Case** report item for the patient
and then submit it.

The patient should automatically get enrolled in the **HIV surveillance Program**
in the DHIS2 instance at http://localhost:8084. To view the enrollment, you will
need to go to the tracker capture app and select the org unit mapped to the
OpenMRS instance from which you submitted the case report.
 
