## 7. Dealing with Compressed files
As disk space is always limited and factoring in the large number of users, it is vital that everyone takes care storing their data properly on Apocrita. Always compress and archive files that aren't used.

### Files
In genomics it is very common to have big files which contain sequence information or mapping files that can tell software and user where each sequence read fits against a certain reference. These files are essentially text files like any other and are often human-readable (for your convenience). Unfortunately that means these types of files take up an enormous amount of space, but there are ways to mitigate this issue. Compression really just means that files are manipulated in such a way that information is denser, making them smaller, although this also means that they cannot be viewed/read unless you reverse the process. The simpler the file, the smaller it gets after compression because there wasn't much information to begin with. It is important to **compress anything that you are not currently using**, as this will save a lot of space on the cluster. 

>*Remember that some tools and applications are able to work with compressed files.*

### Directories
In some cases it isnt a single large file that is causing storage issues. Some programs create a large system of folders filled with lots and lots of tiny files. This can add up quickly and because of the way file systems work there is a "minimum size" that a file can occupy on disk ([if you want to know more about block size](http://lmgtfy.com/?q=block+size+and+min+file+size)). The solution to this problem is to make an archive of the directory. In a Linux/Unix environment the most common archiver is a program called `tar`. `tar` was created to handle problems with block size and writes a single new file, often called tarball, containing everything in the directory. This is not compressed so what you often see is compressed tar archives where the tarball has been run through `gzip`. You should do this as well.

### `tar`
Use the `tar` command to create, and extract, archives of folders. 

`tar -c directory/ > directory.tar` 

`-c` is for create. This creates a new file called `directory.tar` but the original directory is still there. You can now remove the directory.

### `gzip`
Gzip is the go-to program to use for compressing files on any Unix system. Here is how simple it is to use:

`gzip file`

This zips the file up and gives it the .gz extension, note that this replaces the file with the compressed version.

### Extracting compressed files, e.g. .zip  .tar.gz  .tgz
The command for unzipping a file depends on the type of archive it is (i.e. its extension)

```
unzip file.zip          #for .zip
gunzip file.gz          #for .gz
tar -zxvf file.tar.gz   #for .tar.gz
tar -zxvf file.tgz      #for .tgz
tar -jxvf file.tar.bz   #for .tar.bz
```    

>*Notable is that a file may have any extension, it is actually just a part of the file name. However, using proper extensions is a way of letting the user know what kind of file it is. When you move, archive and unzip files etc, make sure that you keep correct extensions on your files, or maybe you wont remember how to open it next time.*

![QMUL logo](./img/qmul_logo.png)