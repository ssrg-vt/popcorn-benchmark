
NGINX 1.3.9 testsuite for Popcorn homogeneous benchmark testing

This benchmark suite has been tested with two x86 VMs.

1) **Clone popcorn-compiler in host machine :**

	a) https://github.com/ssrg-vt/popcorn-compiler.git
	b) git checkout secure-popcorn
	c) run the install_compiler.py (Check before installing if another version of compiler is already present)

2) **Setting up x86 VMs**

	Download VM Image from "https://drive.google.com/open?id=0B7RfKPGm2YZsaURxTVh5ZTMyTk0"
************************************
	Command for Downloading large files from Gdrive --> 
	"wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet 
	--save-cookies /tmp/cookies.txt --keep-session-cookies 
	--no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | 
	sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt "
*************************************
	Change the FILEID with ID. Example for above Glink :" 0B7RfKPGm2YZsaURxTVh5ZTMyTk0" part from the above link.
	Change the FILENAME as x86.img."This takes time to download."

	Make a copy of the image with another name as x86_2.img

3) **Clone and build the popcorn-kernel for x86 varient :**
	a) git clone https://github.com/ssrg-vt/popcorn-kernel.git linux-x86
	b) cp linux-x86/kernel/popcorn/configs/config-x86_64-qemu linux-x86/.config
	c) make -C linux-x86 -j 8
	
*******************************************************	
Now the Home folder should look like this. 		
folder$   x86.img x86_2.img linux-x86/
*******************************************************
Booting the first VM :
	Command --> 
	sudo qemu-system-x86_64     -enable-kvm -cpu host -smp 2 -m 4096 -no-reboot -nographic     
	-drive id=root,media=disk,file=x86.img     -net nic,macaddr=00:da:bc:ef:00:13 -net tap     
	-kernel linux-x86/arch/x86/boot/bzImage     -append "root=/dev/sda1 console=ttyS0"

Booting and Differentiating the second x86 VM :

	The VMs currenntly contain same IP and MAC configured. This section is used to describes how to change. 
	Boot the x86_2.img using the following command.
	
	--> sudo qemu-system-x86_64     -enable-kvm -cpu host -smp 2 -m 4096 -no-reboot -nographic   \  
	-drive id=root,media=disk,file=x86_2.img     -net nic,macaddr=00:da:bc:ef:00:13 -net tap     \
	-kernel linux-x86/arch/x86/boot/bzImage     -append "root=/dev/sda1 console=ttyS0"
	
	Now edit the /etc/network/interfaces file as below only for second machine.
	# The primary network interface
	allow-hotplug eth0
	iface eth0 inet static
        address 10.4.4.101
        netmask 255.255.255.0
        gateway 10.4.4.1
        dns-nameservers 8.8.8.8
		 	hwaddress ether 00:da:bc:ef:00:12	// This tab before the line is important. Dosen't work otherwise.
	
Now you have given the new machine a different static IP and mac address.
	Reboot the second VM once for reflecting the networking changes. 

 4) **Setup the messaging layer in the VMs. (Core of Popcorn) :**

	Wiki Link --> https://github.com/ssrg-vt/popcorn-kernel/wiki/VM-Setup#setup-the-popcorn-messaging-layer
		
------->	For homogeneous copy the x86 verison of "msg_layer.ko" to both VMs.

5) Building the nginx benchmark suite:

	1)Execute the "configure" script present in the root folder of benchmark suite.
	2) make -j8
	3) copy the "nginx" executable to the VMs. 

6) **Place an index.html at the specified location in** 

	server {
        listen       8000;	      --> Port can be changes, make sure to curl same address.
        server_name  localhost;
        #charset koi8-r;
        #access_log  logs/host.access.log  main;
        location / {
            root   /home/popcorn/;	--> Location can be edited but make sure to place file in the location
            index  index.html;
        }

7) **Running the benchmark suite.**
	1) Run the nginx from home folder of Node 0 VM of the popcorn layer.
	Migration points placed

		205 --> migrate(1,NULL,NULL);  //Migrate to Node 1 from Node 0
		278 --> migrate(0,NULL,NULL);  //Migrate to Node 0 from Node 1

	//You can play around placing migration points at any part of the code. 	//The order of migration is to be kept in mind while placeing the points.

8) **Testing Nginx migration :**

	Once the above steps are done , the Nginx is now hopped onto second VM. To test if our benchmark suite is working , 
	perform from your host PC in the same network.

	$ curl 10.4.4.100:8000 (If you configured a different port number change the port) 
		 Example if port is 400 , perform $curl 10.4.4.100:400
		 
	The benchmark works , if the curl command returns the index.html file on host PC. 	 