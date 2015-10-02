## SSH Keys

### Keys
You can set up a pair of SSH keys for a more secure as well as password-less login to Apocrita. This is done by having a private key on your machine, and a matching public key on the remote server, when you try to log in these two match up and let you in without having to type the user password. The private key should never be shared with anyone as it will allow that person access to your login. This is why you should always **protect your private key** with a passphrase.

#### Key Generation
1. Open a terminal window (on Windows, use MobaXterm)
2. Enter `ssh-keygen` and hit enter
3. You will see `Enter file in which to save the key (/home/username/.ssh/id_rsa):` on the screen. Just hit enter here which will save the keys in their default location.
4. The program will now ask you for a passphrase. Please enter one (it is possible to create a key without it but don't, it's to protect from someone getting hold of your private key.)
5. There is a message telling you that the key pair has been created, the public key is now located in /home/my\_username/.ssh/id\_rsa.pub and the private key is /home/my\_username/.ssh/id\_rsa.
6. You are now ready to copy the **public key** to Apocrita

#### Public Key Copy
The process is different depending on which operating system you are using. 

##### Windows and Linux
Here its very simple, open a terminal (or MobaXterm window) and type in `ssh-copy-id btw000@login.hpc.qmul.ac.uk` using your own username. Thats it. Now try your connection `ssh -X btw000@login.hpc.qmul.ac.uk`!

##### Mac
One of the few times having a mac will make you suffer extra work. You will have to manually copy your **public key** to a file located in your home directory on Apocrita.

1. Open a terminal and go to your home directory with `cd`
2. Use `scp` to copy the public key to Apocrita with this command `scp .ssh/id_rsa.pub btw000@login.hpc.qmul.ac.uk:~/`
3. Login to Apocrita `ssh btw977@login.hpc.qmul.ac.uk`
4. `cat ~/id_rsa.pub >> ~/.ssh/authorized_keys`
5. You can now log out and try the connection again to see if your keys work!

>*If you have [Homebrew](http://brew.sh/) installed on your Mac you can use it to install `ssh-copy-id` and go from there.*


### Shortcuts
Another convenience tip is to add shorthand names for your ssh logins. The address to the apocrita head node is quite long and arguably tedious to write. So, this being computer science, of course there is a setup that will allow you to simply type something like `ssh apocrita` on the commandline to connect.

1. `cd ~/.ssh`
2. Open or create the config file `nano config`
3. Add the following, you may call the Host whatever you like, here I'm using "apocrita":
```
Host apocrita
	Hostname frontend1.apocrita.hpc.qmul.ac.uk
	IdentityFile ~/.ssh/id_rsa
	User btw000
	ServerAliveInterval 300
```
4. Save and quit the editor
5. Change permissions of the file `chmod 600 ~/.ssh/config`
6. Try `ssh apocrita`

You may or may not want X11 forwarding and there are other [options](http://linux.die.net/man/5/ssh_config).




