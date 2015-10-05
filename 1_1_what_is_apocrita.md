## 1. What is Apocrita?

### Cluster Structure
Apocrita is a High Performance Computing cluster that consists of many computers, called **nodes**, which are all interconnected. The user logs into one specific node, called a **head node**, from which the rest of the cluster can be accessed. Importantly, ***no jobs are run directly on the head node***. Instead, whenever the user wants to run a job, the details of the job is submitted to a software that handles scheduling of work on the cluster and it is dispatched to a work node when one is available. 

### Nodes
* 150 normal use nodes, two 6-core processors with 24GB RAM
* 11 so called **fat nodes** with four 12-core processors and 512GB RAM. These nodes are used for heavier calculations, in particular ones which require a lot of memory.

### Data
Each user has a specific account on Apocrita which will have a data quota of 50GB in their home directory. Often this is nowhere near enough to run the analysis needed, therefore there is a so called **scratch** space for temporary files. This is where most people do their work but its important to note that that **scratch area is not backed up** and you should treat these as purely temporary. In the future a time-limit may be implemented, automatically deleting old files.

We are working on setting up an archival data space where the user can store data long term, for things like raw and processed data from finished projects that cannot be deleted but probably wont be used a lot in the future. In many cases there is project specific storage implemented.

### System
Apocrita is running [Scientific Linux 6.2](https://www.scientificlinux.org/).
