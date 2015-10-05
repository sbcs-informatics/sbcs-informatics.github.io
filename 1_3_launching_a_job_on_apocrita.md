## 3. Launching a Job on Apocrita
When you log in to Apocrita you will be accessing a **head node**. It is very important that you do not simply run your scripts on the head node. These nodes are there to accomodate logins to the cluster, not workload. Instead, there is a scheduling program running on the cluster 

### Using/Accessing an Apocrita machine to do work.
There are three methods to get your job running on the cluster. Generally speaking, if you just `ssh` into Apocrita's frontend, you can instruct it to do your jobs on your quota of space.

There are two types of instruction for this:
 * `qlogin`  or `qrsh`:  gives you access to one machine (no risks)
 * `qsub`: submits a job you describe in a file to the cluster (no risks)

### `qsub`
This is the easiest way to run your job on Apocrita. Even so, it is not as simple as running your command. Remember, don't run jobs on the head nodes. 

You need to write a script with the instructions for your job, below you find the simplest version of such a script.

```bash
#!/bin/sh
#$ -cwd              # Set the working directory for the job to the current directory
#$ -V
#$ -l h_rt=24:0:0    # Request 24 hour runtime
#$ -l h_vmem=1G      # Request 1GB RAM
./code 				 # Your code goes here
```

After you have written and saved the script you feed it to `qsub` as such

```
qsub job_script.sh
```

For more details have a look at the [ITS research website](https://www.hpc.qmul.ac.uk/twiki/bin/view/HPC/SubmittingJobs), or if you feel like you can take it, the [qsub man page](http://gridscheduler.sourceforge.net/htmlman/htmlman1/qsub.html)

### `qlogin` and `qrsh`
These commands will connect you to one of the worker nodes with the requested resources available for you to use. This will allow you to run your scripts/jobs interactively on a command line. This can be useful if you want to have more freedom in what you are doing than a script allows, but should be avoided for longer jobs as the frontends are rebooted fairly frequently which may kill your job. 

### Monitoring your job
Use `qstat` to show the status of all your jobs on Apocrita, and `qdel` to delete a job from the queue. 
