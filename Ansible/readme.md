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

> Ansible

One of the most popular Configuration management tool.

Ansible is based on push mechanism. In push mechanism the sys admin will write ansible playbook on his laptop and he can push the configuration to 10 (or any number) ec2 instances. Just execute the ansible playbook and the configuration is updated in a push mechanism.

Ansible uses a Agentless model. In ansible we put the names (IP address or DNS) of these servers in a file called inventory.yaml. It must have the passwordless authentication enabled that means the master or the laptop in which ansible playbook is running should be able to connect to the EC2 instances without any password.

One few feature is Introduced in Ansible that is Dynamic Inventory. By using dynamic inventory ansible will auto detect the servers now we dont need to update our inventory file. Suppose we are creating 100 new servers in our aws account, so we can configure ansible in such a way that whenever a new ec2 instance is created in a specific region or availability zone, ansible will directly consider it as a server or instance that has to be managed by ansible.

Ansible support both windows and linux. Ansible is simple as compared to Puppet. Ansible uses YAML for configuration whereas puppet uses its own language that is puppet language.

Puppet is based on pull mechanism. It follows a master slave architecture (Agent based), In puppet there is 1 master puppet server, this master server will configure these 10 ec2 instances / servers as slaves.

Disadvantages

→ Lacks Windows Support
→ Debugging Issue
→ Performance Issue

> Ansible Modules

For example you have nginx load balancer we can write your ansible modules for these things where any developer across different organizations. for example in your organization, organisation owns nginx load balancer we can write some ansible modules for let's say installing load balancer or deleting the load balancer or removing some configuration from the load balancer we can write your own ansible modules and anybody else like let's say this is organization called XYZ and then there is uh some devops engineer in organization called uh ABC. so once you write this ansible modules you can share them using ansible Galaxy and these people in ABC can use the modules.

In simple words, Ansible modules are like small, specialized programs that help Ansible perform specific tasks on remote computers. They act as building blocks that enable Ansible to interact with various systems and services. These modules are designed to handle tasks like installing software, managing files, controlling services, and more.
