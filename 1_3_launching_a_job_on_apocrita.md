## 3. Launching a Job on Apocrita
When you log in to Apocrita you will be accessing a **frontend**. It is very important that you do not simply run your scripts here. These nodes are there to accommodate logins to the cluster, not workload. Instead, there is a scheduling program running on the cluster which takes instructions to your job and distributes the total load over all the worker nodes. You can also use the utility servers interactively by SSHing to them from the frontend.

### Interactive use
These modes will log you in directly to a machine, allowing you to test, develop and try different things out in a single session. This is useful if for example you are trying a new tool out and need to test different parameters or if you are unsure about the syntax of the program. 

#### Using the queueing system on Apocrita

##### `qlogin`
These commands will connect you to one of the worker nodes with the requested resources available for you to use. This will allow you to run your scripts/jobs interactively on a command line. This can be useful if you want to have more freedom in what you are doing than a script allows, but should be avoided for longer jobs as the frontends are rebooted fairly frequently which may kill your job. These commands take the arguments on how what resources you need. For more details, have a look at the [ITS research website](https://www.hpc.qmul.ac.uk/twiki/bin/view/HPC/SubmittingJobs)

Here is an example of logging onto a machine using qlogin:

```
ssh -X btw000@login.hpc.qmul.ac.uk                       #log in to Apocrita
qlogin -l h_rt=3600                                      #request a session 3600s (1h) long
qlogin -l h_rt=10:0:0,h_vmem=4G                          #request 10h and 4G memory
exit                                                     #just type exit to logout
```

Do keep in mind that the frontends are rebooted reasonably frequently to be able to handle all the traffic on them. For this reason, it's best to keep interactive jobs fairly short. Use the utility servers or `qsub` described below for longer runs. 

#### SSHing to a utility server
##### frontend5, frontend6 and SM11
Once you have logged into a frontend of Apocrita, all you need to do to log in to one of these servers is to SSH to that particular name. These machines have all been bought by different groups of academics and priority remains with these groups. This only means that you need to check carefully before you start to work here, if it is free everyone is allowed to make use of the resource. 

```
ssh -X frontend5
ssh -X frontend6
ssh -X sm11
```

These machines are all different, to find out how and why, head to the [advanced section](2_0_advanced.md). It is **VERY** important that you do not overload these servers, it is up to the user to figure out what the load on the machine is and determine if there is room for their job. Use commands such as `top`, `htop` `free` etc. to make sure.

### Non-interactive use
#### Submitting a job script to the queue
This is the easiest way to run your job on the Apocrita cluster. Even so, it is not as simple as running your command. Remember, don't run jobs on the frontends. This method uses a command called `qsub` which takes a script as input. Inside the script you define the resources your job needs.

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

For more details, have a look at the [ITS research website](https://www.hpc.qmul.ac.uk/twiki/bin/view/HPC/SubmittingJobs), or if you feel like you can take it, the [qsub man page](http://gridscheduler.sourceforge.net/htmlman/htmlman1/qsub.html).

### Monitoring your job
Use `qstat` to show the status of all your jobs in the queue on Apocrita, and `qdel` to delete a job from the queue. 

To monitor a job running in an interactive session or on a utility server use a program like `top`. It lists all processes currently running on the machine and allows you to sort them by various criteria like CPU or memory usage. There is an arguably better version of the same type of tool called `htop`. You will need to load it with `module load htop/1.0.3` before you can use it though. Both `top` and `htop` have an argument `-u` taking a username so that you can inspect only your own processes if you want, `htop -u btw000` will show only btw000's processes. 

![QMUL logo](./img/qmul_logo.png)