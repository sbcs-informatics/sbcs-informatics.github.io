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

For an unknown reason the command line version of sftp may or may not work for transfering files. There seems to be some issue with permissions. Use Cyberduck or Filezilla (both thested to be working). 

#### Repeatexplorer
Is set to use an entire fat node on Apocrita.