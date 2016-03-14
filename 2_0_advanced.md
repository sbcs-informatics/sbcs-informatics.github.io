## Advanced

This section contains more advanced information as well as tips and tricks for users who know their way around. Make sure you know what a command found here does before running it. If you are curious about something and want to know if it can be applied to your situation or research, [contact us](3_0_contact.md).

## 1. Apocrita Specifications

### Apocrita cluster nodes
#### Thin nodes
* 150 Nodes
* Dual 6-core Intel Westmere (E5645) - 2.4GHz
* Memory 24GB

Hyperthreading is currently disabled on the thin nodes. 

#### Fat Nodes
* 11 Nodes
* Four 12-core AMD Bulldozer (6234) - 2.4GHz
* Memory 512GB

#### Frontends
* frontend1.apocrita.hpc.qmul.ac.uk - This is the one you should be using to connect to Apocrita. `login.hpc.qmul.ac.uk` currently points to frontend1.
* frontend2.apocrita.hpc.qmul.ac.uk - Sometimes, frontend1 is unavailable, in this case try frontend2. Galaxy runs on frontend2.
* There are other servers with the naming convention frontend# which in fact are **utility servers**, listed below.

#### Other information on Apocrita
* OS - [Scientific Linux 6.2](https://www.scientificlinux.org/)
* Interconnect - Gigabit Ethernet
* Queueing system - Sun Grid Engine 8.0.0e
* Compilers - Intel, Solaris Studio, Open64, Portland
* Parallel libraries - OpenMPI

### Utility servers (SSH-able nodes)

#### sm11
* Purchased by Nichols, Leitch, Rossiter, Buggs, Wurm, Chelala, Clayton and Le Comber

A "set free" fat node that SBCS users can ssh directly into. The GPFS file system is mounted and it should work like any other part of Apocrita, just that the Sun Grid Engine doesn't schedule jobs here so that it is free for users to handle themselves. Check whether or not the machine is free (top, htop) before you start something, and maybe use a [nice value](http://linux.die.net/man/1/nice). To log in, just type `ssh sm11` when logged into a frontend. You can also make an ssh shortcut in your config file, explained below. 

* Four 12-core AMD Opteron(TM) Processor 6234 - 2.4GHz
* Mem 512GB
* 16TB local scratch disk


#### Prometheus
* Purchased with NERC money by Nichols & Wurm.

This machine is not connected to Apocrita. It runs Ubuntu 14.04 and is administrated by SBCS users. A user has to be created for anyone who wants to use this hardware, see below for contact details.

* 2 10-core Intel Xeon CPU E5-2680 v2s clocked at Min:1199.953Mhz Max:2538.265Mhz with hyperthreading ON 
* Kernel 3.18.9-031809-generic x86_64 
* Mem 512GB
* 13TB local scratch disk
* Runs Ubuntu
* Docker installed

Contact: a.larkeryd@qmul.ac.uk, y.wurm@qmul.ac.uk, r.a.nichols@qmul.ac.uk

#### frontend5 and frontend6
* Purchased with NERC money by Nichols & Wurm.

These two identical machines are similar to sm11 but are running newer hardware. For this reason, these two machines are slightly more powerful than sm11. The only difference between the machines is that frontend5 has hyperthreading (HT) turned on and frontend6 has it turned off. If you are aware of your tools running better on HT on/off, you can use the appropriate machine. Please feel free to use the /tmp catalogue on these machines for your temporary analysis files, but remember to move off it as soon as you are done as your files may be deleted during reboots etc. 

* Four 10-core Intel Xeon E5-4640 v2  - 2.20GHz. This means 40 threads with HT off and 80 with HT on.
* Mem 630GB
* 13TB local scratch disk located on /tmp - do NOT store things here, it is ephemeral will be deleted.
* cachecade using a 100GB SSD. This is a caching of the local spinning disks onto the SSD. In principle it should increase performance on /tmp.

### GPU
There are no GPUs on Apocrita, if you need this for your analysis you should talk to your PI about acquisition. ITSR have been looking into the interest of such a purchase. 

## 2. SSH Keys

### Keys
You can set up a pair of SSH keys for a more secure as well as password-less login to Apocrita. This is done by having a private key on your local machine, and a matching public key on the remote server, when you try to log in these two match up and let you in without having to type the user password. The private key should never be shared with anyone as it will allow that person access to your login. This is why you should always **protect your private key** with a passphrase.

#### Key Generation
1. Open a terminal window (on Windows, use MobaXterm)
2. Enter `ssh-keygen` and hit enter
3. You will see `Enter file in which to save the key (/home/username/.ssh/id_rsa):` on the screen. Just hit enter here which will save the keys in their default location.
4. The program will now ask you for a passphrase. Please enter one (it is possible to create a key without it but don't, it's to protect from someone getting hold of your private key.)
5. There is a message telling you that the key pair has been created, the public key is now located in /home/username/.ssh/id\_rsa.pub and the private key is /home/username/.ssh/id\_rsa.
6. You are now ready to copy the **public key** to Apocrita

#### Public Key Copy
The process is different depending on which operating system you are using. 

##### Windows and Linux
Here it's very simple, open a terminal (or MobaXterm window) and type in 
```
ssh-copy-id btw000@login.hpc.qmul.ac.uk
```
using your own username. That's it. Now try your connection
```
ssh -X btw000@login.hpc.qmul.ac.uk
```

##### Mac
>*If you have [Homebrew](http://brew.sh/) installed on your Mac you can use it to install `ssh-copy-id` and go from there.*

One of the few times having a mac will make you suffer extra work. If you do not have Homebrew, you should install it, but if you do not want to do that, you will have to manually copy your **public key** to a file located in your home directory on Apocrita.

1. Open a terminal and go to your home directory with `cd`
2. Use `scp` to copy the public key to Apocrita with this command `scp .ssh/id_rsa.pub btw000@login.hpc.qmul.ac.uk:~/`
3. Login to Apocrita `ssh btw000@login.hpc.qmul.ac.uk`
4. `cat ~/id_rsa.pub >> ~/.ssh/authorized_keys`
5. You can now log out and try the connection again to see if your keys work!

### Shortcuts
Another convenience tip is to add shorthand names for your ssh logins. The address to the Apocrita head node is quite long and arguably tedious to write. So, this being computer science, of course there is a setup that will allow you to simply type something like `ssh apocrita` on the command line to connect.

1. `cd ~/.ssh`
2. Open or create the config file `nano config`
3. Add the following, you may call the Host whatever you like, here I'm using "apocrita":
```
Host apocrita
	Hostname login.hpc.qmul.ac.uk
	IdentityFile ~/.ssh/id_rsa
	User btw000
	ServerAliveInterval 300
	ForwardX11 yes
```
4. Save and quit the editor
5. Change permissions of the file `chmod 600 ~/.ssh/config`
6. Try `ssh apocrita`

Another example, using apocrita (our newly created shortcut to frontend1) as a proxy to connect to sm11. This way all you need to connect to sm11 is `ssh sm11`. 
```
Host sm11
	Hostname sm11
	User btw000
	ProxyCommand ssh apocrita nc %h %p
	ForwardX11 yes
```

You probably want X11 forwarding (-X option in ssh) and there are other [options](http://linux.die.net/man/5/ssh_config).

## 3. `zsh` defaults
These are instructions to set up your shell with some useful `zsh` settings like better auto completion and history etc. It also contains a small set of useful aliases.

### All you need to do
#### Save your old `.bash_profile` and `.zshrc` files
These files control settings which should be set up as you log in. They are located in your home directory and control bash and zsh repsectively (You may not have a `.zshrc` file if you haven't tried that shell before). You will need to remove them in order for this to work, but it is highly recommended that you save them in case you want to go back. If you are controlling bash through a `.bashrc` file, it will not be changed during this process. You might still want to make a backup of that one and remove it in order to have a clean setup to begin with. 

```
cd
mv .bash_profile .bash_profile.BAK        # this file runs every time you log in with bash
mv .bashrc .bashrc.BAK                    # this file is a complement to .bash_profile
mv .zshrc .zshrc.BAK                      # this file runs every time you log in with zsh
```

#### Run the small installation

```
source /data/SBCS-Informatics/zsh_extensions
```
You should find yourself in a helpful shell. Have fun. 

What happened was that a new `.bash_profile` was created which launches `zsh`. This in turn reads a new `.zshrc` file. You may have had some settings set in your old `.bash_profile`, if you want to keep those settings just copy it all to the end of the newly created `.zshrc` file. 

### Features

#### Prompt directory information 
`zsh` will show you an abbreviated version of the full path to where you are, giving you better sense of the file system.

```
/data/scratch/btw000/folder1         # pwd - this is the directory 
[btw000@frontend1 folder1]$          # prompt with default bash settings
btw000@frontend1 /d/s/b/folder1>     # here is how it looks with the new settings
```

#### Better tab completion
Case insensitive tab completion and you can tab between the different options. 

```
btw977@frontend1 ~> cd /data/sbcs    # pressing TAB twice
sbcs/                SBCS-ClareLab/       SBCS-EizaguirreLab/  SBCS-GreyLab/        SBCS-LeitchLab/      SBCS-OsmanLab/
SBCS-BessantLab/     SBCS-ClaytonLab/     SBCS-ElphickLab/     SBCS-HirstLab/       SBCS-MarinakisLab/   SBCS-RossiterLab/
SBCS-BuggsLab/       SBCS-CrespoOtero/    SBCS-EvansLab/       SBCS-HurdLab/        SBCS-McElligottLab/  SBCS-RubanLab/
SBCS-ChassLab/       SBCS-DiTommasoLab/   SBCS-ForniliLab/     SBCS-Irys/           SBCS-MSc-BioInf/     SBCS-StollewerkLab/
SBCS-ChittkaLab/     SBCS-DuffyLab/       SBCS-GoldupLab/      SBCS-LeComberLab/    SBCS-NicholsLab/     SBCS-WurmLab/
```

#### `zsh` 5.0.7
The default version of zsh that every SBCS user has (unless explicitly changed) is version 4.3.10 which doesn't contain all the functionality used here. Because of that a check is made when logging in and if the version of `zsh` isn't 5.0.7, it is loaded. 

#### Oh My Zsh
[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is a large package of settings, plugins and themes for zsh which is used as foundation for these defaults. It has a ton of options but it is kept fairly simple here, including the theme. It does allow for much more customisation which you can do for yourself.

#### Per directory history
This plugin is enabled to give you a command line history that is specific to the directory you are in. That way when you go back to the folder where you carried out your analysis all those months ago you can just press the up-arrow on your keyboard and it will go through what last happened in this particular directory (instead of the failed installation of that python package you were wrestling with yesterday.) Please keep in mind that this is not retroactive!

#### Customising further
Perhaps you want some more fancy features than what is provided here? There are a multitude of themes that change appearance of your shell, or maybe it's syntax highlighting you crave. The setup followed above inserted a sourcing of our general `.zshrc` file in your local version. That file is located in your home directory.

If you are adding things like `module load` commands, aliases, changing your $PATH variable or something similar, the easiest way is to just add it to the end of your new `.zshrc` file which is in your home. 

You can also copy all the contents of the general SBCS-zshrc (/data/SBCS-Informatics/SBCS-zshrc) to your own `.zshrc`. That way you can change anything you like! Add plugins, try the random theme, or even build your own functions. You can of course write your own .zshrc and use [other](https://github.com/sorin-ionescu/prezto) packages. 

There are other shells available as well. `fish` for example, which claims to be "Finally, a command line shell for the 90s". However, `fish` does have slightly different syntax than `bash` and `zsh`, the two of which are very similar. Feel free to keep looking, there are other more obscure things out there. 

#### Going back
To return to your previous settings, remove the two new files `.bash_profile` and `.zshrc` and rename your backed up files to their original names. 

```
cd
rm .bash_profile                        # remove the new bash config
rm .zshrc                               # remove the new zsh config
mv .bash_profile.BAK .bash_profile      # reinstate your old bash profile
mv .bashrc.BAK .bashrc                  # if you were using bashrc
mv .zshrc.BAK .zshrc                    # if you were using zshrc
```

## 4. Oneliners

* [Long list of bioinformatic and non-bio oneliners](https://github.com/stephenturner/oneliners)
* Get all sbcs users: `ldapsearch -x cn=sbcs | grep memberUid | sort`. 

![QMUL logo](./img/qmul_logo.png)