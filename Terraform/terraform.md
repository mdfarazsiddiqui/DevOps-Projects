# Terraform

In simple words, Terraform is a tool used for Infrastructure as Code (IaC), allowing you to define and manage your infrastructure resources in a declarative way using configuration files. It automates the process of setting up and maintaining your cloud infrastructure, making it easier to deploy and manage cloud resources.

Example:

Let's say you want to create a basic web server in a cloud provider like AWS (Amazon Web Services) using Terraform. Here's how you might do it:

Install Terraform: First, you need to install Terraform on your computer.

Configure AWS Credentials: Set up your AWS credentials (access key and secret key) so Terraform can interact with your AWS account.

Create a Terraform Configuration File (e.g., "main.tf"): This file will define the desired state of your infrastructure.

```
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"   # Amazon Linux 2 AMI ID for the desired region
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"
}
```

In this example, you're telling Terraform to use AWS as the provider and specifying the region. Then, you define a resource of type "aws_instance," which represents an EC2 instance (a virtual machine). You provide the AMI ID (Amazon Machine Image) to use for the instance, choose the instance type, and specify the key pair to use for SSH access.

Initialize Terraform: Open your terminal, navigate to the directory containing the Terraform configuration file, and run terraform init. This command downloads the necessary plugins and modules.

Apply the Configuration: Run terraform apply in the same directory. Terraform will analyze the configuration and prompt you to confirm that you want to create the resources. Type "yes" to proceed.

Terraform will then communicate with AWS, create an EC2 instance with the specified configuration, and output the details of the created instance (e.g., public IP address).

Destroy the Resources: When you're done, you can run terraform destroy to remove the infrastructure resources you've created. Terraform will prompt you to confirm, and if you type "yes," it will delete the AWS instance you created.
This example illustrates how Terraform allows you to define your desired infrastructure state in code (HCL - HashiCorp Configuration Language) and then automatically create and manage those resources on your cloud provider. This makes it easier to version control your infrastructure, collaborate with team members, and efficiently manage your cloud resources.

> Features

- Manage any infrastructure
- Track your infrastructure (We dont need to login to the cloud provider and see what is the infra that we have created, Suppose your infra is created using terraform, simply login to the terraform machine and check the state file)
- Automate changes
- Standardize Configurations
- Collaborate

## How Terraform Works?

In the simplest words, Terraform works by taking your Infrastructure as Code (IaC) configuration files, understanding your desired state of the infrastructure, and then automatically making the necessary changes to match that state.

Here's a breakdown of how Terraform works:

Configuration Files: You create configuration files (written in a human-readable language called HCL - HashiCorp Configuration Language) that describe the resources you want to create and manage in your cloud provider or infrastructure.

Initialization: You run terraform init in the directory containing your configuration files. This initializes Terraform, downloading the necessary plugins and modules required to interact with your chosen cloud provider.

Planning: Next, you execute terraform plan. Terraform reads your configuration files, connects to your cloud provider's API, and figures out what changes need to be made to achieve the desired state defined in your files. It presents you with a "plan" that shows what resources will be created, modified, or deleted.

Apply Changes: After reviewing the plan and confirming that it's what you want, you run terraform apply. Terraform then communicates with your cloud provider and automatically creates, modifies, or deletes the necessary resources to match the desired state. It can also handle dependencies and ensure resources are created in the correct order.

State Management: During the process, Terraform keeps track of the current state of your infrastructure in a state file. This file is critical, as it allows Terraform to understand what changes were previously made and what still needs to be done. It prevents unintentional modifications and helps Terraform keep your infrastructure in sync with your code.

Continuous Management: As your infrastructure needs change over time, you can update your configuration files to reflect those changes. When you run terraform apply again, Terraform will apply only the necessary modifications to bring your infrastructure to the updated desired state.

Destruction: If you no longer need certain resources, you can run terraform destroy. Terraform will remove all the resources specified in your configuration files, helping you clean up your cloud environment easily.

In summary, Terraform simplifies infrastructure management by using configuration files to describe your desired infrastructure state. It then automates the process of creating and maintaining those resources on your cloud provider, making it easier to manage, scale, and version-control your infrastructure.

Reference : [Terraform AWS Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
