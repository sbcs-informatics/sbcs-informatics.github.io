## 6. Copying & Downloading Files 
Files can be copied in an around your computer, in and around your space on the servers, and between the two. The basic copy function, `cp`, is for within locations (i.e. your computer or the server). To go between the two, use 'secure copy', `scp`.

The basic syntax is 'cp, original file location, new file'.
### Between a remote server and local machine
From local file to server: 

```
scp /path/to/local/file.txt server:/path/to/server/directory_or_newfile.txt
```

For example:

```
scp /Users/bob/Desktop/data.csv btw000@frontend1.apocrita.hpc.qmul.ac.uk:/home/btw000/archive/2013/data.csv
```

From server to local directory on local machine:

```
scp btw000@frontend1.apocrita.hpc.qmul.ac.uk:/home/btw000/myoutput.pdf .
```

>*Note, "`.`" means "current directory".*

### Within your home computer, or the servers
This is just the same, except replace `scp` with `cp`.
    
```
cp /path/to/file.extension /new/directory/
```

### Using a graphical user interface (GUI)
[Cyberduck](http://cyberduck.ch) (on Mac) or [FileZilla](http://filezilla-project.org) (on Windows).
These two are GUI programs which offer file-sharing via a straightforward drag-and-drop or by menu navigation. 

Both programs have a facility for attaching your account and passwords to them so they'll log in automatically. Make sure you check in the preferences/options/settings to set the file transfer protocol to "ssh", as that's not usually the default.

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