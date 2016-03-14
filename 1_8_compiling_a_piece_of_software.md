## 8. Available Software

### What is installed on Apocrita?
Software installed on the cluster is handled through something called the `module` command. Each tool installed is a module which can be loaded into your session. `module` has a number of subcommands which you can see by running just `module`. These are the most commonly used:

```
module avail                     #prints a long list of available modules
module avail py                  #prints all available modules starting with "py"
module load python/3.4.3         #loads python 3.4.3
module unload python/3.4.3       #unloads python to return to to sweet 2.X
module clear                     #unloads all loaded modules
```

All `module` commands work with tab-completion, that way you can type `module load java` and press <TAB> twice to see all available java versions. 

The only problem with these modules is that they are not always up to date. You may have to ask for a new version to be installed if you want to be on the bleeding edge.

### Installing new software
If you need a tool that is not currently available there are essentially two ways to get new software on Apocrita. Either request an installation by ITS Research, or install it yourself in your home directory.

#### Requesting installation by ITS Research
If you are looking into a piece of software that you think/know other users will have much use of it is best to have it installed for everyone, available through the `module` commands. The easiest way to create an application ticket with ITS Research is by filling in [this form](http://docs.hpc.qmul.ac.uk/apps/requesting/) or sending an email to **its-research-support@qmul.ac.uk** explaining what software you want installed and providing relevant links to the software webpage. 

#### Compiling software yourself
If you are in a rush, or if the software is experimental, etc. it might be better to compile it yourself and keep it in your home directory. 

Software for Unix systems is generally distributed as archives. To install a software package:

Download it (perhaps with [`wget`](1_6_copying_and_downloading_files.md)). Then decompress it (perhaps with [`unzip` or `tar`](1_7_dealing_with_compressed_files.md)). Then check the installation instructions, usually in an `INSTALL` or `README` file. A lot of the time this will involve running a script called `configure` followed by typing `make` in the directory.

Keep in mind that by default most software will try to install in directories in which you do not have permissions to write. In almost all cases there are options to instead install the tool in an alternate location. Use these options to install software in your home directory. Often this includes using the `--prefix` parameter in the `configure` script. 

Some readme files are more useful than others. If there is no help in the readme, but there is a file called `makefile` in the directory, just type `make` and that should work. What happens usually in this case is that the compiled software is created in the same directory.

![QMUL logo](./img/qmul_logo.png)