## 4. Basic UNIX Navigation

### Where am I?
Files are organised in your allocated server space into folders, or 'directories', just like on your regular computer. You can check your current working directory (i.e. where you are) with the 'print working directory' command, `pwd`.



### Checking the contents of directory
It's easy to check the contents of the directory you're currently in, using the list command, `ls`. This works similarly to the `ls()` command in R, which lists the objects in your workspace.
Typing `ls` alone will list the filenames. However, if you require extra information you can add 'flags' after the command to give the computer further instructions:

    ls           #prints filenames in a list
    ls -a        #prints all filenames, including hidden files
    ls -l        #'long' list, displays info including permissions.
    ls -h        #prints the sizes of files in units you can read
    ls -tr       #t for time sorted, r for reverse
The above flags (amongst others) can be combined together in one string for convenience. You may use one `-` (to indicate a flag) followed by all required characters, or separate them individually:
    
    ls -lhatr          #has the same effect as 
    ls -l -h -a -t -r

    
This bit will print a list of files with all of the above information.


### Changing directories
Navigate through directories using the 'change directory' command, `cd`.  It will assume you're looking for a directory name that is within your current working directory

#### Change directory

    cd directory_name/
    
#### Go back "up" one directory: 
    cd ../
    cd ../../                    #you can go several at a time
    cd ../../anthr_dir/subdir2   #as many as you want

#### Return to home directory
    cd ~/
or just 
    
    cd

>*Note: On Mac, it's possible to click and drag the desired location of a directory or file from the finder (by the icon) to the terminal. Just type `cd` followed by a space, click & drag, hit enter. You can do this from any starting point.*

---
##5. Playing with Files

### Creating a new directory 
The `mkdir` command will create a directory inside your current location.
    
    mkdir newdirectoryname 
### Moving files in local machine
The `mv` command will remove a file or directory from its current location and place it elsewhere. The syntax is, "move, current location, new location". It can also be used to rename files.

If the new location is a file, the file is renamed:

    mv oldfile newfile
    
 or if the target is a directory, the file is moved:

    mv oldfile newdirectory/  
    
 

### Delete files or directories
Delete files with the 'remove' command, `rm`:

    rm filename

or for a directory `rmdir`, the directory has to be empty:

    rmdir directory/
You can use `rm` to remove directories with the `-r` option, it removes files in a directory recursively. Be careful when using `rm`, once you hit enter, the files are gone. After adding & removing files and directories, you can check and make sure it's worked using the `ls` command.
    
### Viewing different parts of an existing file
`less` shows a small portion of the file, `more` shows a larger portion (according to the manual, it will display your file 'one screen's worth of lines at a time'). `head` displays the first ten lines, and `tail` displays the last ten lines.

    less filename.extension
    more filename.extension
    
The head and tail commands can be modified to show a specific number of lines, with a flag `-n`, where n= number of lines:

    head -15 file.txt   #displays the first 15 lines
    tail file.txt       #displays the last 10 lines (default)

### Searching for a pattern within a file
The `grep` function searches for a particular pattern of characters. The syntax for the grep function is: 'grep, "pattern", file-to-look-in'.
   e.g. 
   
    grep "scaffold" genome.fasta