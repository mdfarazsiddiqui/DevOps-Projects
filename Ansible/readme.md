# Ansible

> Configuration Management

- Configuration management is a way DevOps engineers manage the configuration of servers or infrastructure.

Suppose you are a system engineer @ ABC company, they have their servers on premises (on their own data center). Lets say they have 100 servers out of those (50 servers are hosted on linux, 25 on CentOs, 25 on Ubuntu). As a System Admin we are responsible for managing these servers we have to upgrade the OS to latest versions, security patches, installations (install softwares depends on the requirements).

So, It is extremely difficult to manage these servers we have to login to each server and perform the operation (installation, upgrades etc) and it is time consuming process. \*

> One Approach to solve this issue

- By writing shell scripts for different OS (for linux is shell script, for windows it will be powershell). Command will change based on the OS. The Shell Script will loop over all the 100 or 1000 servers and perform the operation like installation, upgrades, patches etc by running the script (commands inside it). It is also difficult for system admin to manage for on premises. \*

> After Evolution of Cloud

- After the Evolution of Cloud The requirement of servers is increased by 10x as compared to on premises. By using microservices or cloud the size of the server is reduced (means compute or resources consumption is decreased). Lets say previosuly by having physical server we need 16 gb ram and 8 core processor servers but by using microservices architecture we need very small amount of configuration for the server because of this the number of server is increased by leaps and bounds. If the number is increased it will be difficult to manage for the developer team so in order to resolve these issue there is a concept introduced that is Configuration management. In this case also shell scripting will work but it is not a recommended way to manage these servers.

Configuration management will aim to solve the problem of managing the configuration of multiple servers. Nowadays most of the companies have 100s or 1000s of servers due to the advancement of cloud.

Some of the most popular Configuration management tools:

1. Puppet
2. Chef
3. Ansible (Most of the users/devops engineers use this tool)
4. Salt \*
