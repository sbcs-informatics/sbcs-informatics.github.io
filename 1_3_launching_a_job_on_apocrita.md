## 3. Launching a job on Apocrita


### Using/Accessing an Apocrita machine to do work.
Three methods. Generally speaking, if you just `ssh` into Apocrita's frontend, you can instruct it to do your jobs on your quota of space. You can request to increase this if neccesary. There are two types of instruction for this:
 * `qlogin`  or `qrsh`:  gives you access to one machine (no risks)
 * `qsub`: submits a job you describe in a file to the cluster (no risks)

Alternatively, using the SBCS only node, `sm11`, your job won't be restricted and will use whatever it needs. This could be risky, and you can break things:  be absolutely certain your job is not too big to run. 
 * `ssh` into `sm11`

### Determining if the machine is available for doing work (ie. RAM, CPU)
This is **essential**  if working on sm11. If using `qrsh` or `qsub` or `qlogin`, the scheduling system handles everything like that.
It is **extremely important** that: 
 * you check that sufficient RAM is available.
 * you check that sufficient compute power (ie. processors, CPUs) are available. 

For this, `top` can help. This command lists current usage of the server, by which users and what they're currently running.
