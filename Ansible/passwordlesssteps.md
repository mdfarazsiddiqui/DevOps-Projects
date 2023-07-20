Steps

1. Create an EC2 Instance (this ec2 machine would be the host machine eg: dev-ec2)
2. Connect to the machine using ssh
3. Write the cmd sudo apt update and sudo apt install ansible (this ec2 machine would be the host machine eg: dev-ec2)
4. Check ansible version by using this command: ansible --version

We need two servers (ec2 instances) in order to configure the other server by using this server

By using the dev-ec2 server (also ansible server) we will configure the other server known as (target-server)

How to set passwordless authentication?

1. We use passwordless authentication to connect to the EC2 instance (server) without any password.

2. first copy the private IP address from the aws management console

-> One way is by using this cmd (ssh-copy-id private-ip) private IP address of the system you want to configure.

-> 2nd Way (Preferred) by using ssh-keygen cmd
ssh keygen - will generate a public private key for you to authenticate. This command will create a directory inside /home/ubuntu/.ssh/. It will contain the authorized keys, id_rsa (private key), id_rsa.pub (public key), known hosts

id_rsa : is used to login to this machine

Go inside this directory /home/ubuntu/.ssh/ and open the id_rsa.pub file and then copy the content inside public key.

Then Login to the second machine i.e (target-server) (that is to be configured)

then write the same ssh-keygen cmd inside this server as well and generate the key inside this same directory /home/ubuntu/.ssh/

then go inside the /home/ubuntu/.ssh/ directory and open the authorized_keys file using vim cmd and then copy the id_rsa.pub file content (key) of the another server (dev-ec2) and then save that file.

then go back to the main server (dev-ec2) type ssh (private ip address) like (ssh 142.21.17.111) and then it will be connected to another server i.e target-server without any password.

This configuration is the prerequisite for ansible.

1. Install ansible (done)
2. Setup Passwordless authentication (done)
