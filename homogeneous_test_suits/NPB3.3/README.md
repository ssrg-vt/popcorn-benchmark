Build process:
	1) ./setclass.sh  {S | A | B}  choose one of the options S or A or B
	2)  make 

Testing :

	1) Each benchmark test contains a folder and corresponding binary.
	   Copy the binaries into the remote machines. 
	2) Execute the binary of choice at node 0.
	3) Observe the migration between nodes. 
