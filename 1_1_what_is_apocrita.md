## 1. What is Apocrita?

### Cluster structure
Apocrita is a High Performance Computing cluster that consists of many computers, called **nodes**, which are all interconnected. The user logs into one specific node, called a **head node**, from which the rest of the cluster can be accessed. Importantly, ***no jobs are run directly on the head node***, instead whenever the user wants to run a job, the details of the job is submitted to a software that handles scheduling of work on the cluster and it is dispatched to a work node when one is available. 

### Nodes
* 150 normal use nodes, two 6-core Intel processors with 24GB RAM
* 11 so called **fat nodes** with four 12-core processors and 512GB RAM
