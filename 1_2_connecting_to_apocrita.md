## 2. Connecting to Apocrita

### Get an account on the cluster

To get an Apocrita account you need to make a [request to ITS Research](https://www.hpc.qmul.ac.uk/twiki/bin/view/HPC/RequestAccount). Once this has been set up you can continue to log in with the details provided

### Logging in from Mac (or other unix systems)
OS X (and indeed all Linux distributions) have an application called Terminal. On your Mac you can find it in Applications -> Utilities.

1. Open Terminal
2. Enter the following
```
ssh -X [youruserID]@frontend1.apocrita.hpc.qmul.ac.uk
```
e.g.
```
ssh -X btw000@frontend1.apocrita.hpc.qmul.ac.uk
```
3. Enter your password when prompted (It will not appear as you type, this is by design, your keystrokes are being registered)

To avoid having to type your password each time you log in You can also set up SSH keys that will be used when you log in from your computer instead of a password. There are instructions on how to set up SSH keys in the [advanced section](2_0_advanced.md)

### Logging in from Windows 

The simplest way of doing things on Windows is using a program called [MobaXterm](http://mobaxterm.mobatek.net/). 

1. [Download](http://mobaxterm.mobatek.net/download.html) the newest version of MobaXterm
2. Create a session
3. Enter the address to frontend1 which is `frontend1.apocrita.hpc.qmul.ac.uk`
4. You can also enter username and password to save them here
5. Connect and enter your username and/or password when prompted

If you would rather use PuTTY. 

1. [Download](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) PuTTY
2. In the host name window enter the server address `frontend1.apocrita.hpc.qmul.ac.uk`
3. Enter the correct port number (22) and check on correct connection type (SSH)
4. Now go to the data tab under connection and in auto-login username box enter your username (e.g.btw000)
5. Go back to the session tab and in the saved sessions box enter a name for this log in (e.g. frontend1)
6. Save!
7. Double click the session name and enter your password where prompted


### Display
If you're planning on using any graphical interface, e.g. plotting in R, you need the X11 fowarding flag, `-X`. This instructs the terminal forward display items to your computer, that will allow you to see your plots or other graphical user interfaces. You might as well always have this option set - to simplify things. MobaXterm uses X11 forwarding by default. 

```
ssh -X btw000@frontend1.apocrita.hpc.qmul.ac.uk
```

### Keep your terminal as you log out or lose network connection
When you shut your laptop down the connections it has made with Apocrita (and the rest of the outside world) will be interrupted. This can happen randomly at other times as well and the implication is that anything you were running in your terminal on Apocrita will be shut down too, along with the connection. 

#### Screen
Usefully, the program `screen` allows you to keep a process running on a server without the need to be consistently connected to the network. It sets up a session that will stay active even if you quit your terminal, you can just connect to the session later and you will find yourself exactly where you left off. 

* screen -ls                   # list all your sessions
* screen -r <session_id>       # reconnect to a session
* CTRL+A, CTRL+D               # pressing these two key bindnings will detach you from the current screen session
* CTRL+D                       # CTRL+D without CTRL+A first will terminate the session instead 
* man screen                   # manual for screen - explaining every option


#### Make a specific command uninterruptable
When a terminal is shut down, a so called hangup signal is sent to any process running in that terminal telling it to quit. There is a way you can make your process ignore that specific signal with `nohup`. It is very simple to use, you add `nohup` before your command as such:

```
bwa mem -t 10 -p inputreference.fa inputfasta.fastq > outputfile.sam &               #if this is your command
nohup bwa mem -t 10 -p inputreference.fa inputfasta.fastq > outputfile.sam &         #do this instead
nohup nice bwa mem -t 10 -p inputreference.fa inputfasta.fastq > outputfile.sam &    #its a good idea to add a nice value as well
```

An ampersand, &, at the end of a command will send it to the background, however this is not enough as it will still be sent the hangup signal when the terminal is closed.

The last example includes the `nice` command as well. `nice` tells the computer that your process should be run with a lower priority, a good idea if you are leaving your process unattended! This does not mean it will take any longer than normal as long as there is available CPUs on the machine.

Keep in mind that nohup will redirect the output if it is a set to a terminal - use `man nohup` for more information. `nohup` does not prevent other signals and will not make your process unkillable!

![QMUL logo](./img/qmul_logo.png)