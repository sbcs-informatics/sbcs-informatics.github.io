## 4. Basic UNIX Navigation

### Where am I?
Files are organised in your allocated server space into folders, or 'directories', just like on your regular computer. You can check your current working directory (i.e. where you are) with the 'print working directory' command, `pwd`.

### Checking the contents of directory
It's easy to check the contents of the directory you're currently in, using the list command, `ls`. This works similarly to the `ls()` command in R, which lists the objects in your workspace.
Typing `ls` alone will list the filenames. However, if you require extra information you can add 'flags' after the command to give the computer further instructions:

```bash
ls           #prints filenames in a list
ls -a        #prints all filenames, including hidden files
ls -l        #'long' list, displays info including permissions.
ls -h        #prints the sizes of files in units you can read
ls -tr       #t for time sorted, r for reverse
```

The above flags (amongst others) can be combined together in one string for convenience. You may use one `-` (to indicate a flag) followed by all required characters, or separate them individually:
    
```bash
ls -lhatr          #has the same effect as 
ls -l -h -a -t -r
```
    
This bit will print a list of files with all of the above information.


### Changing directories
Navigate through directories using the 'change directory' command, `cd`.  It will assume you're looking for a directory name that is within your current working directory

#### Change directory

```bash
cd directory_name/
```

#### Go back "up" one directory: 

```bash
cd ../
cd ../../                    #you can go several at a time
cd ../../anthr_dir/subdir2   #as many as you want
```

#### Return to home directory

```bash
cd ~/
```
or just 
    
```bash
cd
```

>*Note: On Mac, it's possible to click and drag the desired location of a directory or file from the finder (by the icon) to the terminal. Just type `cd` followed by a space, click & drag, hit enter. You can do this from any starting point.*
