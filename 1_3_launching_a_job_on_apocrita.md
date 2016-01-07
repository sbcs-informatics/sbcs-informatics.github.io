## 3. Launching a Job on Apocrita
When you log in to Apocrita you will be accessing a **frontend**. It is very important that you do not simply run your scripts here. These nodes are there to accomodate logins to the cluster, not workload. Instead, there is a scheduling program running on the cluster which takes instructions to your job and distributes the total load over all the worker nodes. You can also use the utility servers interactively by SSHing to them from the frontend.

### Interactive use
These modes will log you in directly to a machine, allowing you to test, develop and try different things out in a single session. This is useful if for example you are trying a new tool out and need to test different parameters or if you are unsure about the syntax of the program. 

#### Using the queueing system on Apocrita


#### SSHing to a utility server
##### VM21, VM22 and SM11
Once you have logged into a frontend of Apocrita, all you need to do to log in to one of these servers is to SSH to that particular name. 

```
ssh -X vm21
ssh -X vm22
ssh -X sm11
```

These machines are all different, to find out how and why, head to the [advanced section](2_0_advanced.md). It is **VERY** important that you do not overload these servers, it is up to the user to figure out what the load on the machine is and determine if there is room for their job.

### Non-interactive use
#### Submitting a job script to the queue
This is the easiest way to run your job on Apocrita. Even so, it is not as simple as running your command. Remember, don't run jobs on the head nodes. This method uses a command called `qsub` which takes a script as input. Inside the script you define the resources your job needs.

You need to write the script with the instructions for your job, below you find the simplest version of such a script. Use this as a template and add options as needed. There are several more options you can add to the header of your script which for example allows for more cores to be used.

```bash
#!/bin/sh
#$ -cwd              # Set the working directory for the job to the current directory
#$ -V
#$ -l h_rt=24:0:0    # Request 24 hour runtime
#$ -l h_vmem=1G      # Request 1GB RAM
./code               # Your code goes here
```

After you have written and saved the script you feed it to `qsub` as such

```
qsub job_script.sh
```

For more details have a look at the [ITS research website](https://www.hpc.qmul.ac.uk/twiki/bin/view/HPC/SubmittingJobs), or if you feel like you can take it, the [qsub man page](http://gridscheduler.sourceforge.net/htmlman/htmlman1/qsub.html).

#### Monitoring your job
Use `qstat` to show the status of all your jobs on Apocrita, and `qdel` to delete a job from the queue if you changed your mind about running the job.

### Using/Accessing an Apocrita machine to do work.
There are three methods to get your job running on the cluster. Generally speaking, if you `ssh` into Apocrita's frontend, you can instruct it to carry out your jobs on your quota of space using any of these methods.

There are two types of instruction for this:
 * `qlogin`  or `qrsh`:  gives you access to one machine
 * `qsub`: submits a job you describe in a file to the cluster



### `qlogin` and `qrsh`
These commands will connect you to one of the worker nodes with the requested resources available for you to use. This will allow you to run your scripts/jobs interactively on a command line. This can be useful if you want to have more freedom in what you are doing than a script allows, but should be avoided for longer jobs as the frontends are rebooted fairly frequently which may kill your job. These commands take the same options as `qsub`. 

### Monitoring your job
Use `qstat` to show the status of all your jobs on Apocrita, and `qdel` to delete a job from the queue. 

![QMUL logo](./img/qmul_logo.png)