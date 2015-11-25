## 10. Galaxy
There is a Galaxy server set up on Apocrita. 

### Login
[https://galaxy.hpc.qmul.ac.uk/](https://galaxy.hpc.qmul.ac.uk/) - This is the link to the web interface. 

To log in, use your entire QMUL email address ie j.doe@qmul.ac.uk as username and your Apocrita password. 

### SFTP
You can use SFTP to transfer large files to the Galaxy server. Use a [GUI program](1_6_copying_and_downloading_files.md) to connect to the server using SFTP and transfer your files. The hostname is the same as the website, galaxy.hpc.qmul.ac.uk.

Remember to set SFTP and not FTP. 

### Specifics
The actual server runs on frontend2 but it uses DRMAA to submit jobs to the cluster queue. It will run jobs as the "galaxy" user, that means that the user starting the job is not the one that executes it on the cluster, but the username is listed in the job name in the queue.

For an unknown reason the command line version of sftp may or may not work for transfering files. There seems to be some issue with permissions of files sometimes. Use Cyberduck if you can. Contact Adrian Lärkeryd or ITS-Research if you're having issues with the file transfer.

This server is still very much experimental and things change. If something is not working or you need a new tool installed do not hesitate to [contact](3_0_contact.md) Adrian.

#### Repeatexplorer
Is set to use almost an entire fat node on Apocrita. Unfortunately it doesnt allow for dynamically changing the resource requirement, thus even a small job will request a lot of resources from the cluster and be stuck in the SGE queue for longer than necessary. The main requirement of this tool seems to be memory and the biggest nodes on the cluster have 512GB of RAM. It is possible that some very large jobs could exceed that limit and be killed.