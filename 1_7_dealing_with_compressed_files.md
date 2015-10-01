## 7. Dealing with Compressed files
### A note on file systems MAYBE MISINFORMED, AT LEAST MISLEADING
Within a computer's hard drive (which come in various physical forms), the information is stored in small 'blocks' of data. The size of these blocks is relative to the size of the hard disks, with larger hard disks having larger constituent blocks. Importantly, any individual file stored on a hard disk, regardless of its actual size, can take up a minimum of one block. Another factor which varies with hard disk size is the speed at which it can access its files. As an analogy, imagine the computer physically looking for an object in its hard drive. If there's more space, it takes longer to look through it all (this isn't actually precisely the case, but it's a fair way to think about it).

The hard disks in the clusters are of varying size and speed. Accordingly, within your allocated workspace, there are three pre-made directories. _Archive_ sends files to one of the larger, slower hard disks. This has the most space, so use it for keeping any large files you aren't currently using but may need in the future. the _work_ directories allocate your files to one of the smaller, faster disks which allows the computers processing the data on them to get through them faster. 

Storing your data in the correct folders can make a big difference to how efficiently the cluster carries out your job. Only having one type (generally the slow kind) of hard drive on your personal computer won't really make that much difference because you're unlikely to have ever done something more computationally sophisticated than compiling or saving a complicated photoshop file. However on a supercomputer processing a massive amount of data - like whole genomes or highly iterative mathematical models - ease of access to data is as important as the right kind of equipment is to a professional athlete, shaving hours (or even days!) off how long a job takes.

### Compressed Files
Compressed files fit into a smaller space, in a file type commonly called an 'archive'. It works by taking lots of small files, which each individually would fit in a single block but are held separate by the computer, and telling it to turn all of them into one file, which can take up a minimum of one block on its own. Hence, if you have a collection of files that are all only a tenth of a block in size, compressing them into an archive will allow them to take up a tenth of the space. This is useful for a) conserving space and b) holding & distributing collections of files e.g. software on the internet. Downloading one small box full of everything you need is much more convenient than downloading several similar sized boxes and sorting them out on your own!

Compressed files are the flat-packs of the computing world. It's worth noting that while a compressed file takes up a lot less space than its constituent parts, the data inside have to be 'extracted' (read: built) into their original form before a computer can use them again. 

For that reason, if you're making archives to store your files in, it will allow you to hold a lot more data on your server space, but it's probably best to store them in the 'archive' directory, they'll just get in the way elsewhere. Extract your data into a working directory before working on it.

### Creating an archive
Compressed files have extensions like .zip (common in everyday computing) and .gz.
You can compress a file using the `gzip` command:
    
`gzip file`

This zips the file up and gives it the .gz extension.

### Extracting compressed files, e.g. .zip  .tar.gz  .tgz
The command for unzipping a file depends on the type of archive it is (i.e. its extension)

```
unzip file.zip          #for regular .zip
gunzip file.gz          #for .gz
tar -zxvf file.tar.gz   #for .tar.gz
tar -zxvf file.tgz      #for .tgz
tar -jxvf file.tar.bz   #for .tar.bz
```    

