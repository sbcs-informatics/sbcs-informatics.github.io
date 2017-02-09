## 11. Singularity Pilot

ITS Research have installed [Singularity](singularity.lbl.gov) for us to test in SBCS. Singularity is a containerisation platform which enables full control of the environment in which a program runs, without having to rely on libraries and software installed on the Apocrita filesystem. 

#IF YOU WANT TO TRY SINGULARITY DURING THE PILOT PHASE PLEASE [CONTACT ADRIAN](3_0_contact.md)

### Containers
There are many flavours of containers and each has benefits and downsides. Docker is the most ubiquitous and the platform with the most features. However, there are some serious security flaws which prevents us from using Docker on the HPC. Singularity does however support a very simple import of Docker containers from the repository [Docker Hub](hub.docker.com).

### Quick-start import a Docker container from [Docker Hub](hub.docker.com)
If you have ever found a docker container you might want to use on Apocrita, the following will explain how to make it run on the cluster through Singularity. You do not need a Docker Hub user account but you do need to know the Docker Hub user and container names.

The only thing you need is access to a machine with Singularity installed where you have administrator permissions. This can be a Virtual Machine (VM) with Linux and Singularity installed in it or your local Linux machine if you have one. If you are unsure about what this means or how to create a VM like that, [please get in contact](3_0_contact.md).

#### 1. Create a definition file
Create a new text file and enter the following. Exchange the name of the Docker container from Docker Hub in the second line after `From: ` to your preferred container. Leave everything else as it is. The Docker Hub user in this example is bioconductor and the container name is release_sequencing. The identifier for this container is thus `bioconductor/release_sequencing`. 

`my_definition_file.def`:
```bash
Bootstrap: docker
From: bioconductor/release_sequencing
IncludeCmd: yes

%post
        mkdir /data
```

#### 2. Build the image
To create the image and import the docker container run the following commands. Depending on the size of the Docker container, you may have to increase the size of your image. This is the step which requires administrative permissions on a Linux machine. 

```bash
sudo singularity create --size 1024 image_name.img       
# Create empty image of size 1024MB

sudo singularity bootstrap image_name.img my_definition_file.def
# Run bootstrap on that image
```

#### 3. Copy the image to Apocrita and run!
The image is ready to be transferred to Apocrita for execution on the cluster. 

```bash
scp image_name.img btw000@login.hpc.qmul.ac.uk:~/
# Using scp to copy the image to your home directory on Apocrita
```

Once the image is on the Apocrita file system, create your submission script and add the following to run your newly created container. 

You can test your container in a qlogin session

```bash
qlogin
module load singularity
singularity exec image_name.img command_name argument1 argument2

#singularity exec image_name.img    <- This is a Singularity call
#command_name argument1 argument2   <- This is your call to the software
```

### Creating a custom definition file
Unlike Docker, Singularity does not have a daemon running as root to control the containers running on the system. Everything is running as your user. However, in the steps that build the image file you need sudo access. For this reason, those steps cannot be completed on the Apocrita file system and must be carried out on another machine. This could for example be your desktop computer if you have a linux machie, a Virtual Machine you have set up yourself, or the vagrant VM that ITSR provides. After you are done creating the image you can copy it to Apocrita and run it. 

There are three fundamental steps to creating and running a container with Singularity.

1. Writing a bootstrap definition file
2. Creating the empty image and running the bootstrap (ie installing the things described in the definition file inside the image file)
3. Running the container

#### Definition file
This is a description file which tells singularity what to put inside the image. There are a few ways of doing it, but the most fundamental way is to have it download a version of ubuntu or centos, then install your tools/libraries through yum/apt-get/git etc. You can also import Docker images in the bootstrap step. 

Here is an example of a fairly simple .def file (This particular one installs bowtie2-2.3.0 from sourceforge):

The first three lines describe how to start the bootstrap procedure, here we choose Ubuntu Xenial and point to where it can be downloaded. Everything in the %post block runs once when the image is bootstrapped. A %test section is included as well to make sure everything worked out. There are other sections you can include here too, see the [Singularity documentation](http://singularity.lbl.gov/bootstrap-image).

```bash
Bootstrap: debootstrap
OSversion: xenial
MirrorURL: http://archive.ubuntu.com/ubuntu/

# Requires 1024MB image size

%post 
	# Create the /data directory
	mkdir /data

	apt-get update
	
	# This is needed to be able to add the universe repo
	# which is needed for apt to find libtbb-dev

	apt-get install -y software-properties-common     
	add-apt-repository universe                       												  
	
	# Running normal apt-get update and isntalling the tools needed
	apt-get update
	apt-get install -y vim wget unzip build-essential libtbb-dev

	# Downloading from sourceforge and installing
	wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.0/bowtie2-2.3.0-source.zip

	unzip bowtie2-2.3.0-source.zip
	cd bowtie2-2.3.0/
	make
	make install

%test
	bowtie2 -h
```

#### Bootstrap
To create an image which contains the things you detailed in the definition file, you need to first create an empty image and then run the bootstrap. These two steps are the only ones that require sudo access. The default image size is 768MB, which is enough for many lightweight toolchains, but you can decide the image size yourself. Unfortunately it cannot be automatically grown by the bootstrap command, so if it runs out of space it will just crash. If this happens, delete the image and create a new one with larger size and try again. Sometimes its hard to tell what size you will need, I have created images varying in size from 768MB to 10GB. 

```bash
sudo singularity create --size 1024 image_name.img       
# Create empty image of size 1024MB

sudo singularity bootstrap image_name.img definition_file.def
# Run bootstrap on that image
```

#### Execution
This is the step in which you will run the container and the tools you have packaged within. This step does not require sudo access, but it does take settings from a global configuration file which ITSR has control over. The image is immutable once created so you will not be able to install any more tools or anything like that, you also cannot change/store data in the image once its been created. All of that will have to happen in the bootstrap step, so if you want to change the version of the tool installed, you need to create a new image and bootstrap it with a different definition file. 

```bash
singularity exec image_name.img command [arguments ...]

# For example, to print bowtie2 help
singularity exec ubuntu-bowtie2-2.3.0.img bowtie2 -h
```

You can also shell into the container, either by using the singularity shell command or by exec invoking bash/sh:

```bash
singularity shell image_name.img

singularity exec image_name.img bash
```


#### Singularity on Apocrita
Singularity is installed on Apocrita and ITSR have allowed access to those willing to try it out. However, because singularity needs sudo access to create the empty image and for the bootstrap step, those two steps need to be completed outside Apocrita. Execution of a container does not require sudo access and thus it is possible to create the image on your own machine, copy it over to Apocrita and then run your packaged tool through singularity as your Apocrita user. 

##### /data mount
In order to have access to your data on Apocrita, you need to create the /data directory in your image during the bootstrap step. After doing that, Singularity will be able to mount all your data directories automatically when you run the container. If you do not have the /data directory made in your bootstrap step the container will not have any access to your data files on Apocrita. 

You do this in the %post section of your bootstrap definition file. It does not matter where, but I usually put it in the beginning to remember.

##### MPI
Singularity does support MPI over the cluster scheduler out of the box. In order to get it running there are a couple of things you need to do though. 

###### Building the image
In order to take advantage of MPI on the cluster a version of MPI must be installed in the singularity image, as well as a way for the MPI jobs to communicate. 

* The MPI version must be the same as the one you load on Apocrita
	* Loading the module openmpi/1.6.5 on Apocrita means you need to install Open MPI 1.6.5 in the bootstrap step of your image
* Installing openssh-server (using either yum or apt-get depending on your flavour) in the bootstrap step should enough to handle communications

###### Executing the image on the queue
Requesting an MPI environment on the cluster can be done in several ways. The new hardware provision will provide a large number of compute cores with high performance interconnect, which is perfect for MPI. It is still not clear whether these machines will be on a separate queue or if everything will be handled by the scheduler internally. 

This is an example of a submission script which utilises MPI on the old provision. The number of parallel slots must match the -np argument supplied to mpirun!

```bash
#!/bin/sh
#$ -cwd              # Set the working directory for the job to the current directory
#$ -V                # 
#$ -pe parallel 4    # Request 4 parallel slots
#$ -l h_rt=1:0:0     # Request 1 hour runtime
#$ -l h_vmem=1G      # Request 1GB RAM per core

module load use.dev
module load singularity
module load openmpi/1.6.5/gcc/4.7.2 # OpenMPI 1.6.5 is installed in the image

mpirun -np 4 singularity exec ./ubuntu-mrbayes-3.2.6.img mb ./examples/hymfossil.nex

# The image is called ubuntu-mrbayes-3.2.6.img
# and the command running within the container is mb ./examples/hymfossil.nex
```


##### Issues
Singularity is running with surprising smoothness, but not everything worked right away. 

###### MPI - SOLVED
Had to install correct version of OpenMPI and install openssh-server to get it working. More details in the MPI section above. 

###### Image size - WORKAROUND
Singularity does not automatically create an image of the correct size for your container, you need to specify the image size in the create step and if its too small the bootstrap step will fail. On the other hand you do not want to specify a huge image size because you will need to copy the image around afterwards!

There is a command to grow the image size - unfortunately I have found that once your bootstrap step has failed once, it will not work to run the bootstrap again on the same image. This is a minimal annoyance as you can just delete the image and create a new one with larger size, which is what I have been doing when I run into space issues in the bootstrap step.

I have tried to get into the habit of adding image size specifications in the .def file so that a future user will know what image size is needed to successfully complete the bootstrap step. 

###### /data mount - SOLVED
Singularity will automatically mount your home directory, but it did not automatically mount the rest of /data, which is where almost all users have their data spread out. ITSR changed the config file for Singularity to automatically mount all of /data instead of just /data/home/username, that way all data that users have access to should be available in the container. Very simple and quick fix.

###### debootstrap not installed - SOLVED
This was a minor issue, but the host you are creating your images on has to have the tool debootstrap installed if you are going to base your images on ubuntu. This has to be installed with yum on a centos machine and may have to be installed even on ubuntu machines. `sudo yum install debootstrap` should do the trick. You might have to install yum on ubuntu to create centos images? (Not tested)

###### .def file too large - WORKAROUND
Found that one of my def files was too large, singularity complains in the bootstrap step if there is too many characters in the %post section. I recompiled Singularity on the machine where I build the images after editing some of the C code. It did work but I had to run the binary from the src directory, running `sudo make install` did not change anything...! More info on this [github issue](https://github.com/singularityware/singularity/issues/456).


![QMUL logo](./img/qmul_logo.png)