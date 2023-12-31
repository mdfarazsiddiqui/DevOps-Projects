## Ansible Playbooks

With Ansible playbooks, you can define a series of steps, called tasks, that should be performed on target machines. These tasks can range from installing software, configuring settings, managing files, and even running complex operations.

## Ansible Adhoc Commands

In simple words, Ansible ad-hoc commands are quick, one-line instructions that you can use to perform simple tasks on remote computers or devices without writing a complete playbook. With Ansible ad-hoc commands, you can execute common tasks such as checking system information, installing packages, restarting services, or copying files, among others. They are especially useful for performing quick actions on multiple machines simultaneously, without the need for more complex configuration or organization.

---

> To run Ansible Adhoc commands

use this command:

to create a simple file in the target server using the host server (dev-ec2)

If we have multiple ip addresses we can group them in a inventory file and then provide the name of the group

Inventory File = simply stores Ip addresses of the target servers

ansible -i inventory_file_location ip_address_of_the_target_server or use all (it will add the ip address of all the target servers mentioned in inventory file)

like this: ansible -i inventory_file_location all -m "module" -a "touch testfile"
-m = module, here "shell" (using shell we can create a file) is a module that you can refer from ansible modules official docs : https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html
-a = -a stands for what is the command that we want to execute like touch we used we can change that as well
like: ansible -i inventory_file_location all -m "module" -a "df"
output will be disk usage

eg: ansible -i inventory all -m "shell" -a "touch devopsclass" -> this will create a devopsclass file in target server

If you want to perform some other operation just refer the official ansible modules doc. Search copy on docs if you want to copy from 1 server to another. And then just replace the module from shell to copy. and add the arguments as given after -a argument.

Suppose if we have multiple target servers one are related to databaseservers and another is related to webservers. So if there is a use case that certain number of config or playbooks we want to run for databaseservers and some for webservers. In order to do this we have to do grouping of servers in inventory file like this

[dbservers]
ip addresses

[webservers]
ip addresses

![Alt text](image.png)

the command would be like this:

instead of all it should be the group name. It will perform on the servers within that group.

ansible -i inventory_file_location webservers -m "module" -a "touch testfile"

For performing these simple task on a target server we use ansible adhoc commands, for performing a set of tasks or operations we create ansible playbooks.

---

> How to write ansible playbooks??

Lets understand by a scenario Suppose we want to install nginx, start nginx.

Just create a my_first_playbook.yaml file using vim

start by using --- (to show it is as a yaml file)

name: contains the small desc like Install and Start Nginx

hosts: contains lists of hosts (target-servers) on which this playbook has to run(like all or webserver or dbserver)

become: root (How you want to execute this script is it by using the root user or same user. It will execute the script/playbook using the root user)

tasks: contains the tasks or operations you want to perform.

Eg :

---

- name: Install and Start Nginx
  hosts: all
  become: yes

  tasks:

  - name: Install nginx
    apt:
    name: nginx
    state: present (present means to install)
    <!-- shell: apt install nginx It is equivalent to above command -->

  - name: Start nginx
    service:
    name: nginx
    state: started

    ![Alt text](image-1.png)

    Change become root to yes

    <!-- Proper Indentation should be there, Indent is not working due to prettier extention -->

    We can write single or multiple playbooks in a file.

  How to run ansible playbook?

  ansible-playbook cmd is used to run ansible playbooks

  command: ansible-playbook -i inventory-file name_of_the_playbook.yaml

  After executing this command. Check on the target servers that nginx is running or not.

  to check : sudo systemctl nginx status

  ***

  verbose = to enable verbose mode use -v flag in the command
  to increase verbosity = add -vvv flag in the command

---

Example 2 ansible playbook

Scenario

- Create 3 EC2 instances on AWS (Terraform is mostly used to create EC2 instances but we can use ansible as well)
- Configure 1 of those EC2 instances as master (ansible is used to configure)
- Configure 2 other EC2 instances as worker (ansible is used to configure)

Ansible Roles

In simple words, Ansible roles are like pre-packaged sets of tasks and configurations that you can reuse and share to simplify the management of your servers and infrastructure.

Think of them as ready-made sets of instructions that help you accomplish specific tasks or set up particular components of your system. Rather than writing everything from scratch every time you need to perform a certain action, you can create or use existing roles to automate the process.

Roles in Ansible allow you to organize and structure your playbooks (the files containing your automation instructions) in a more modular and reusable way.

Ansible roles is a simple and efficient way of writing ansible playbooks that will improve your efficiency to write complex playbooks.

cmd : ansible-galaxy role init kubernetes

this cmd will create a role and will generate some files and configurations. Using these files and folders we can structure our ansible playbooks.

reference : https://github.com/mdfarazsiddiqui/ansible-examples/
