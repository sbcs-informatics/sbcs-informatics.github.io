## Advanced

This section contains more advanced information as well as tips and tricks for users who know their way around. Make sure you know what a command found here does before running it. If you are curious about something and want to know if it can be applied to your situation or research, [contact us](3_0_contact.md).

## 1. Oneliners

* [Long list of bioinformatic and non-bio oneliners](https://github.com/stephenturner/oneliners)
* Get all sbcs users: `ldapsearch -x cn=sbcs | grep memberUid | sort`. Can email to <username>@qmul.ac.uk directly

## 2. Apocrita Specifications

### Apocrita cluster nodes
#### Thin nodes

* 150 Nodes
* Dual 6-core Intel Westmere (E5645) - 2.4 GHz
* 24G RAM

Hyperthreading is currently enabled on the Intel CPUs but each (serial) job is allocated a single real core

#### Fat Nodes

* 11 Nodes
* Four 12-core AMD Bulldozer (6234) - 2.4 GHz
* Memory 512GB

#### Interconnect
Gigabit Ethernet

#### Queueing system
Sun Grid Engine 8.0.0e

#### Compilers
Intel, Solaris Studio, Open64, Portland

#### Parallel libraries
OpenMPI

### SSH-able nodes

#### SM11
A "set free" fat node that SBCS users can ssh directly into. The GPFS is mounted and it should work like any other part of Apocrita, just that the Sun Grid Engine doesnt schedule jobs here so that it is free for users to handle themselves. Check whether or not the machine is free before you start something big, and maybe use a [nice value](http://linux.die.net/man/1/nice).

* Four 12-core AMD Opteron(TM) Processor 6234 - 2.4 GHz
* Mem 512GB


#### Prometheus
Purchased with NERC money by Nichols & Wurm.

This machine is not connected to Apocrita. It runs Ubuntu 14.04 and is administrated by SBCS users. A user has to be created for anyone who wants to use this hardware, see below for contact details.

* 2 10-core Intel Xeon CPU E5-2680 v2s clocked at Min:1199.953Mhz Max:2538.265Mhz with hyperthreading ON 
* Kernel 3.18.9-031809-generic x86_64 
* Mem 512GB
* Runs Ubuntu
* Docker installed

Contact: a.larkeryd@qmul.ac.uk, y.wurm@qmul.ac.uk, r.a.nichols@qmul.ac.uk

#### VM21 & VM22
The VMs are two nodes of the Apocrita cluster on which a KVM is running. These were set up in order to have Docker running on the cluster, however this is not yet up and running properly. Users can log in to these nodes and run their programs, however there are some caveats. Only a few core modules are available at the moment (module avail). There is also a possibility that the virtual machine is slowing the nodes down. Benchmarks are to be held to determine exact implications of this. Possible that one machine will be reinstalled without the KVM.


### GPU
There are no GPUs on Apocrita, but there is one node attached to Taurus with 2 NVidia C2070 GPU cards in it.

## 3. SSH Keys

### Keys
You can set up a pair of SSH keys for a more secure as well as password-less login to Apocrita. This is done by having a private key on your machine, and a matching public key on the remote server, when you try to log in these two match up and let you in without having to type the user password. The private key should never be shared with anyone as it will allow that person access to your login. This is why you should always **protect your private key** with a passphrase.

#### Key Generation
1. Open a terminal window (on Windows, use MobaXterm)
2. Enter `ssh-keygen` and hit enter
3. You will see `Enter file in which to save the key (/home/username/.ssh/id_rsa):` on the screen. Just hit enter here which will save the keys in their default location.
4. The program will now ask you for a passphrase. Please enter one (it is possible to create a key without it but don't, it's to protect from someone getting hold of your private key.)
5. There is a message telling you that the key pair has been created, the public key is now located in /home/my\_username/.ssh/id\_rsa.pub and the private key is /home/my\_username/.ssh/id\_rsa.
6. You are now ready to copy the **public key** to Apocrita

#### Public Key Copy
The process is different depending on which operating system you are using. 

##### Windows and Linux
Here its very simple, open a terminal (or MobaXterm window) and type in `ssh-copy-id btw000@login.hpc.qmul.ac.uk` using your own username. Thats it. Now try your connection `ssh -X btw000@login.hpc.qmul.ac.uk`!

##### Mac
One of the few times having a mac will make you suffer extra work. You will have to manually copy your **public key** to a file located in your home directory on Apocrita.

1. Open a terminal and go to your home directory with `cd`
2. Use `scp` to copy the public key to Apocrita with this command `scp .ssh/id_rsa.pub btw000@login.hpc.qmul.ac.uk:~/`
3. Login to Apocrita `ssh btw977@login.hpc.qmul.ac.uk`
4. `cat ~/id_rsa.pub >> ~/.ssh/authorized_keys`
5. You can now log out and try the connection again to see if your keys work!

>*If you have [Homebrew](http://brew.sh/) installed on your Mac you can use it to install `ssh-copy-id` and go from there.*


### Shortcuts
Another convenience tip is to add shorthand names for your ssh logins. The address to the apocrita head node is quite long and arguably tedious to write. So, this being computer science, of course there is a setup that will allow you to simply type something like `ssh apocrita` on the commandline to connect.

1. `cd ~/.ssh`
2. Open or create the config file `nano config`
3. Add the following, you may call the Host whatever you like, here I'm using "apocrita":
```
Host apocrita
	Hostname frontend1.apocrita.hpc.qmul.ac.uk
	IdentityFile ~/.ssh/id_rsa
	User btw000
	ServerAliveInterval 300
```
4. Save and quit the editor
5. Change permissions of the file `chmod 600 ~/.ssh/config`
6. Try `ssh apocrita`

You may or may not want X11 forwarding and there are other [options](http://linux.die.net/man/5/ssh_config).



