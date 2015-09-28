## 2. Connecting to Apocrita

### Windows 

Download PuTTY. In the host name window enter the server address e.g.  

    frontend1.apocrita.hpc.qmul.ac.uk 

Enter the correct port number (22) and check on correct connection type (SSH). Now go to the data tab under connection and in auto-login username box enter your username (e.g.bt12345). Go back to the session tab and in the saved sessions box enter a name for this log in (e.g. frontend1). Save! 

Now double click the name which should open up the Apocrita window. In the window, after your username, double click to bring up a highlighted bar. Now copy password and then right click to paste it into the box. The password won't appear but it should log on.

### Mac

It's much easier on Macs as the Apple OS is unix-based.
If you just need the commandline, open Terminal (this is accessible from Spotlight or in Applications/Utilities).

    ssh [youruserID]@frontend[1/2].apocrita.hpc.qmul.ac.uk

e.g.: 

	ssh btw666@frontend1.apocrita.hpc.qmul.ac.uk

If you have a shortcut: 

    ssh sm11 [for sbcs node]
    
If prompted, enter the password given by ITS research. You can also set up SSH keys that will be used when you log in from your computer instead of a password.

### Screen

Finally, if you're planning on using any graphical interface, specifically something which requires plots, add the screen flag, `-X`. This instructs the terminal to open a graphics window, that will show your plots etc. This is useful when working in R and viewing plots, otherwise you'll have to save them to .pdfs and download them every time.

	ssh -X sm11
or

	ssh -X btw666@frontend1.apocrita.hpc.qmul.ac.uk

Usefully, the screen feature allows you to keep a process running on a server without the need to be consistently connected to the network (e.g. when you're carrying your laptop between home and campus and can't be connected to the internet). This is worth remembering for if/when you have a job that requires a lot of time to run.
    
