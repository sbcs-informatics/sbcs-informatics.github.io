## 1. What is Apocrita?

### Cluster Structure
Apocrita is a High Performance Computing (HPC) cluster that consists of many interconnected computers, called **nodes**. The user logs into one specific **head node**, from which the rest of the cluster can be accessed. On Apocrita these are called **frontends**. Importantly, ***no jobs are run directly on the frontends***. Instead, whenever the user wants to run a job, the details of the job is submitted to a software that handles scheduling of work on the cluster and it is dispatched to a work node when one is available. There are also **utility servers** which the user can interactively log in to. More information on utility servers can be found below and in the [advanced section](2_0_advanced.md).

Apocrita and all the other peripheral machines are run by the [ITS Research team](http://www.its.qmul.ac.uk/research/). They have a documentation site available [here](http://docs.hpc.qmul.ac.uk/). 

#### Nodes
* 150 normal use nodes each with two 6-core processors, i.e. 12 cores, and 24GB RAM
* 11 so called **fat nodes** each with four 12-core processors, i.e. 48 cores, and 512GB RAM. These nodes are used for heavier calculations, in particular ones which require a lot of memory.

For more information on the specifications on Apocrita nodes, see the [advanced section](2_0_advanced.md).

#### Utility servers
There are a number of very specific so called utility servers that are part of the HPC resources but not the general Apocrita system. Users can SSH to these machines and use them interactively for their analysis. These servers were all purchased separately with different funding, keep this in mind as groups who have contributed to the acquisition of these machines have priority. With that said, feel free to use these resources when they are available, you can find more information in the [advanced section](2_0_advanced.md).

#### Galaxy
There is a Galaxy server set up on Apocrita through which you can run some general (and some more specific) analyses in a graphical web interface. For more information on Galaxy, see the [specifications here](1_10_galaxy.md).

#### Data
Each user has a specific account on Apocrita and have a data quota of 50GB in their home directory. Often this is nowhere near enough to run the analysis needed, therefore there is a so called **scratch** space for temporary files. This is where most people do their work but it's important to note that that **scratch area is not backed up**. In the future a time-limit on files may be implemented, automatically deleting old files in the scratch space.

##### Home
* Is tiny
* Is backed up
* Is for your personal scripts and installations, small files you use often and want to keep safe

##### Scratch
* Is **NOT** backed up
* Is communal, you're not the only user here - keep this in mind and write only in your directories
* Is temporary - **NEVER** store files on a scratch space, they will be deleted sooner or later

##### Lab specific storage
* Each lab has a 1TB space, some labs have purchased additional storage
* Ask your supervisor about access to your lab space
* This is usually for medium term storage of data etc., but each lab handles their area internally


##### Archive
There is an archive available for long term storage of data. It is called Hive and can be accessed from anywhere on a Queen Mary network. It is only available with ssh key authentication, so in order to log in you need to create one or more [ssh keys](2_0_advanced.md). You need to create a key for each machine youre logging in from, i.e. if you want access from both your desktop computer and Apocrita you will need to create two keys, one on your desktop and one while logged into Apocrita. You cannot copy your own key to the Hive, instead you have to send an email to its-research-support@qmul.ac.uk with your public keys and Apocrita username. Remember to CC your PI to get access to the correct subfolder of the Hive. 

* Log in with your Apocrita username
* hive-master.hpc.qmul.ac.uk
* 120TB storage available
* 
* Backed up by mirroring to an identical setup
* Accessible via SFTP, rsync, scp
* For storing files you cannot delete for one reason or another
* Please remember to [**compress**](1_7_dealing_with_compressed_files.md) your files before transferring them to the archive

#### System
Apocrita is running [Scientific Linux 6.2](https://www.scientificlinux.org/).

![QMUL logo](./img/qmul_logo.png)
