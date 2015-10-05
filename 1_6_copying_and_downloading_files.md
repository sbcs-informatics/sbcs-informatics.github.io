## 6. Copying & Downloading files 
Files can be copied in an around your computer, in and around your space on the servers, and between the two. The basic copy function, `cp`, is for within locations (i.e. your computer or the server). To go between the two, use 'secure copy', `scp`.

The basic syntax is 'cp, original file location, new file'.
### Between a remote server and local machine
From local file to server: 

```
scp /path/to/local/file.txt server:/path/to/server/directory_or_newfile.txt
```

From local file to server file:

```
scp /Users/bob/Desktop/data.csv btw666@frontend1.apocrita.hpc.qmul.ac.uk:/home/btw666/archive/2013/data.csv
```

From server to local directory on local machine:

```
scp btw666@frontend1.apocrita.hpc.qmul.ac.uk:/home/btw666/myoutput.pdf .
```

>*Note, "`.`" means "current directory".*

### Within your home computer, or the servers
This is just the same, except replace `scp` with `cp`.
    
```
cp /path/to/file.extension /new/directory/
```

### Using a graphical user interface
[Cyberduck](http://cyberduck.ch) (on Mac) or [FileZilla](http://filezilla-project.org) (on Windows).
These two are GUI programs which offer file-sharing via a straightforward drag-and-drop or by menu navigation. 

Both programs have a facility for attaching your account and passwords to them so they'll log in automatically. Make sure you check in the preferences/options/settings to set the file transfer protocol to "ssh", as that's not usually the default.

>*Note that while these systems are convenient for moving and organising your files, that's all they do. Alas, it's back to the command line to do anything with your files.*


### Downloading files from the web
`wget` is short for "web-get", and will download a target file into your current working directory, e.g. 
    
```
wget http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz
```

Here wget is used to download an old version of itself
