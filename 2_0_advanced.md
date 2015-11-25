## Advanced

This section contains more advanced information as well as tips and tricks for users who know their way around. Make sure you know what a command found here does before running it. If you are curious about something and want to know if it can be applied to your situation or research, [contact us](3_0_contact.md).

## 1. Apocrita Specifications

### Apocrita cluster nodes
#### Thin nodes

* 150 Nodes
* Dual 6-core Intel Westmere (E5645) - 2.4GHz
* Memory 24GB

Hyperthreading is currently enabled on the Intel CPUs but each (serial) job is allocated a single real core

#### Fat Nodes

* 11 Nodes
* Four 12-core AMD Bulldozer (6234) - 2.4GHz
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
A "set free" fat node that SBCS users can ssh directly into. The GPFS is mounted and it should work like any other part of Apocrita, just that the Sun Grid Engine doesnt schedule jobs here so that it is free for users to handle themselves. Check whether or not the machine is free (top, htop) before you start something, and maybe use a [nice value](http://linux.die.net/man/1/nice). To log in, just type `ssh sm11` when logged into a frontend. You can also make an ssh shortcut in your config file, explained below. 

* Four 12-core AMD Opteron(TM) Processor 6234 - 2.4GHz
* Mem 512GB
* 16TB local scratch disk


#### Prometheus
Purchased with NERC money by Nichols & Wurm.

This machine is not connected to Apocrita. It runs Ubuntu 14.04 and is administrated by SBCS users. A user has to be created for anyone who wants to use this hardware, see below for contact details.

* 2 10-core Intel Xeon CPU E5-2680 v2s clocked at Min:1199.953Mhz Max:2538.265Mhz with hyperthreading ON 
* Kernel 3.18.9-031809-generic x86_64 
* Mem 512GB
* 13TB local scratch disk
* Runs Ubuntu
* Docker installed

Contact: a.larkeryd@qmul.ac.uk, y.wurm@qmul.ac.uk, r.a.nichols@qmul.ac.uk

#### VM21 & VM22
The VMs are two nodes of the Apocrita cluster on which a KVM is running. These were set up in order to have Docker running on the cluster, however this is not yet up and running properly. Users can log in to these nodes and run their programs, however there are some caveats. Only a few core modules are available at the moment (module avail). There is also a possibility that the virtual machine is slowing the nodes down. Benchmarks are to be held to determine exact implications of this. Possible that one machine will be reinstalled without the KVM.

* VM21 and VM22 are running on frontend5 and frontend6 respectively
* Four 10-core Intel Xeon E5-4640 v2  - 2.20GHz
* Mem 516GB


### GPU
There are no GPUs on Apocrita, but there is one node attached to Taurus with two NVidia C2070 GPU cards in it.

## 2. SSH Keys

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

Another example, using apocrita (our newly created shortcut to frontend1) as a proxy to connect to SM11. This way all you need to connect to SM11 is `ssh sm11`. 
```
Host sm11
	Hostname sm11
	User btw000
	ProxyCommand ssh apocrita nc %h %p
```

You may or may not want X11 forwarding and there are other [options](http://linux.die.net/man/5/ssh_config).

## 3. `zsh` defaults
These are instructions to set up your shell with some useful `zsh` settings like better autocompletion and history etc. It also contains a small set of useful aliases.

### All you need to do
#### Save your own `.zshrc` file
This is the file that says what zsh should do when you log in. You have one in your home directory which you will have to remove in order for this to work. This way you can keep your previous `.zshrc` if you feel like going back.

```bash
cd
mv .zshrc .zshrc.BAK
```

#### Run the small installation

```bash
source /data/SBCS-Informatics/zsh_extensions
```
You should find yourself in a helpful shell. Have fun. 

### Details

#### `zsh` 5.0.7
The default version of zsh that every SBCS user has (unless explicitly changed) is version 4.3.10 which doesn't contain all the functionality used here. Because of that a check is made when logging in and if the version of `zsh` isnt 5.0.7 it is loaded. 

#### Oh My Zsh
[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is a large package of settings, plugins and themes for zsh which is used as foundation for these defaults. It has a ton of options but it is kept fairly simple here, including the theme. It does allow for much more customisation which you can do for yourself.

#### Per directory history
This plugin is enabled to give you a comman line history that is specific to the directory you are in. That way when you go back to the folder where you carried out your analysis all those months ago you can just press the up-arrow on your keyboard and it will go through what last happened in this particular directory (instead of the failed installation of that python package you were wrestling with yesterday.)

#### Customising further
Perhaps you want some more fancy features than what is provided here? There are a multitude of themes that change appearance of your shell, or maybe its syntax highlighting you crave. The setup followed above inserted a sourcing of our general `.zshrc` file in your local version. That file is located in your home directory. In order to change the settings you need to replace your `.zshrc.` with the contents of the SBCS-Informatics-zshrc. That way you can change anything you like! Add plugins, try the random theme, add your own aliases or even build your own functions. You can of course write your own .zshrc and use [other](https://github.com/sorin-ionescu/prezto) packages. 

There are other shells available as well. `fish` for example, which claims to be "Finally, a command line shell for the 90s". However, `fish` does have slightly different syntax than `bash` and `zsh`, the two of which are very similar. Feel free to keep looking, there are other more obscure things out there. 

## 4. Oneliners

* [Long list of bioinformatic and non-bio oneliners](https://github.com/stephenturner/oneliners)
* Get all sbcs users: `ldapsearch -x cn=sbcs | grep memberUid | sort`. Can email to <username>@qmul.ac.uk directly
