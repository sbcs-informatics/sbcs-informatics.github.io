## 6. Copying & Downloading Files 
Files can be copied in an around your computer, in and around your space on the servers, and between the two. The basic copy function, `cp`, is for local to local copy (i.e. your within computer or wihtin the server). To go between the two, use `rsync` or the slightly more simple `scp`.

The basic syntax is `cp /path/to/source/file /path/to/destination`.

### Between a remote server and local machine
The most reliable and easiest way to copy and sync files between different machines is rsync. 

`rsync -avP ~/my-work username@remote_host:/path/to/destination/`

This bit of code will copy the directory "my-work" to the destination at the remote host.

To copy files from Apocrita to the Hive, use the following while logged into Apocrita:

`rsync -avP ~/my-work btw000@hive-master.hpc.qmul.ac.uk:/SBCS-BloggsLab/btw000/`

rsync has many options, find out more by reading the manual (`man rsync`) or look at an [online guide](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps).

scp is very similar, but it doesn't have the syncing capabilities of rsync, it is therefore best used to copy single files. To use `scp` to copy from server to directory on local machine:

```
scp btw000@frontend1.apocrita.hpc.qmul.ac.uk:/home/btw000/myoutput.pdf .
```

>*Note, "`.`" means "current directory".*


### Using a graphical user interface (GUI)
[Cyberduck](http://cyberduck.ch) (on Mac) or [FileZilla](http://filezilla-project.org) (on Windows).
These two are GUI programs which offer file-sharing via a straightforward drag-and-drop or by menu navigation. 

Both programs have a facility for attaching your account and passwords to them so they'll log in automatically. Make sure you check in the preferences/options/settings to set the file transfer protocol to "SFTP", as that's not usually the default.

>*Note that while these systems are convenient for moving and organising your files, they will not let you schedule jobs or run anything on the server. Alas, it's back to the command line to do anything using the Apocrita computational resources.*

### Mounting your Apocrita file system on your computer
You can use some third party software to easily mount your Apocrita file system on your computer, that way you can manipulate your files in your operating system, and programs on your personal computer will be able to read and write files on Apocrita. 

[Here is a good guide for every OS](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh). 

### Downloading files from the web
`wget` is short for "web-get", and will download a target file into your current working directory, e.g. 
    
```
wget http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz
```

Here wget is used to download an old version of itself. It is often much easier to download a new piece of software or data straight to the server using `wget`, instead of first downloading it to your local machine and then `scp`-ing the package over. Just copy the download link of the file when you're browsing and paste it to `wget`.  

![QMUL logo](./img/qmul_logo.png)