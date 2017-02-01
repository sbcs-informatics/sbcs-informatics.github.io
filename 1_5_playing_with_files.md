## 5. Playing with Files

### Creating a new directory 
The `mkdir` command will create a directory inside your current location.
    
```
mkdir newdirectoryname 
```

### Moving files in local machine
The `mv` command will move a file or directory from its current location and place it elsewhere. The syntax is, `mv current_location new_location`. It can also be used to rename files.

If the new location is a file, the file is renamed:

```
mv oldfile newfile
```

or if the target is a directory, the file is moved:

```
mv oldfile newdirectory/  
```

### Delete files or directories
Delete files with the 'remove' command, `rm`:

```rm filename```

or for a directory `rmdir`, the directory has to be empty:

```rmdir directory/```

You can use `rm` to remove directories with the `-r` option, it removes files in a directory recursively. **Be careful** when using `rm`, once you hit enter, the files are gone. After adding or removing files and directories, you can check and make sure it worked using the `ls` command.
    
### Viewing different parts of an existing file
`less` shows a small portion of the file, `more` shows a larger portion (according to the manual, it will display your file 'one screen's worth of lines at a time'). `head` displays the first ten lines, and `tail` displays the last ten lines. Both `head` and `tail` have several useful options like how many lines to display.

```
less filename.txt         #look through file with less
tail -n35 filename.txt    #print last 35 lines of file
```

### Searching for a pattern within a file
The `grep` function searches for a particular pattern of characters. The syntax for the grep function is: `grep pattern file-to-look-in`. `grep` will by default print the whole line in which it found the pattern. There are options to have it print only the match, line numbers, or just a count of how many times the pattern was found.

e.g. 
   
```
grep "scaffold" genome.fasta    #prints all lines with "scaffold" in them
grep ">" genome.fasta -c        #counts the number of ">" characters in the file
```

![QMUL logo](./img/qmul_logo.png)