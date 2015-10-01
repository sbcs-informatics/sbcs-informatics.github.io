##5. Playing with Files

### Creating a new directory 
The `mkdir` command will create a directory inside your current location.
    
```bash
mkdir newdirectoryname 
```

### Moving files in local machine
The `mv` command will remove a file or directory from its current location and place it elsewhere. The syntax is, "move, current location, new location". It can also be used to rename files.

If the new location is a file, the file is renamed:

```bash
mv oldfile newfile
```

 or if the target is a directory, the file is moved:

```bash
mv oldfile newdirectory/  
```

### Delete files or directories
Delete files with the 'remove' command, `rm`:

```bash rm filename```

or for a directory `rmdir`, the directory has to be empty:

```bash rmdir directory/```
You can use `rm` to remove directories with the `-r` option, it removes files in a directory recursively. Be careful when using `rm`, once you hit enter, the files are gone. After adding & removing files and directories, you can check and make sure it's worked using the `ls` command.
    
### Viewing different parts of an existing file
`less` shows a small portion of the file, `more` shows a larger portion (according to the manual, it will display your file 'one screen's worth of lines at a time'). `head` displays the first ten lines, and `tail` displays the last ten lines.

```bash
less filename.extension
more filename.extension
```

The head and tail commands can be modified to show a specific number of lines, with a flag `-n`, where n= number of lines:

```bash
head -15 file.txt   #displays the first 15 lines
tail file.txt       #displays the last 10 lines (default)
```

### Searching for a pattern within a file
The `grep` function searches for a particular pattern of characters. The syntax for the grep function is: 'grep, "pattern", file-to-look-in'.
   e.g. 
   
```bash
grep "scaffold" genome.fasta
```
