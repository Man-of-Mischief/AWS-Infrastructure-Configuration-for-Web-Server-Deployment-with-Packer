# AWS Infrastructure Configuration for Web Server Deployment with Packer and Terraform

This repository contains configuration files for provisioning and deploying a web server infrastructure on AWS using Packer and Terraform.

## Table of Contents

- [Description](#Description)
- [Prerequisites](#Prerequisites)
- [Usage](#Usage)
- [Folder Structure](#Folder-Structure)
- [Contributing](#Contributing)
- [Follow Me](#Follow-Me)


## Description

This project aims to automate the deployment of a web server infrastructure on AWS using Infrastructure-as-Code principles. It utilizes Packer for creating custom Amazon Machine Images (AMIs) and Terraform for provisioning the necessary AWS resources.

The infrastructure setup includes the following components:

- Packer
- EC2 Instances
- Elastic IP (EIP)
- Security Group
- Route 53 DNS Records

## Prerequisites

Before using this infrastructure configuration, ensure that you have the following prerequisites:

- AWS account credentials with necessary permissions.
- Packer installed on your local machine.
- Terraform installed on your local machine.
- SSH key pair for accessing the EC2 instances.

## Usage

To use this code, follow these steps:

1. Clone the repository:
   ```
   git clone https://github.com/Man-of-Mischief/AWS-Infrastructure-Configuration-for-Web-Server-Deployment-with-Packer.git
   ```
2. Configure your AWS credentials by providing the access key and secret key in the respective configuration files (main.pkr.hcl and provider.tf).

3. Customize the configuration files based on your requirements. Modify variables and settings according to your desired infrastructure configuration.

4. Build the custom AMIs using Packer:
   ```
   cd packer
   packer build .
   ```
   
5. Provision the infrastructure using Terraform: 
   ```
   cd terraform
   terraform init
   terraform apply
   ```
   Note: Make sure to review the Terraform execution plan before applying changes to avoid any unwanted modifications.

6. Access the deployed web server using the provided URL in the Terraform output.
   
## Folder Structure

The repository is organized into the following folders:

- packer/: Contains the Packer configuration files.
- terraform/: Contains the Terraform configuration files.

## Contributing
Contributions to this repository are welcome. If you find any issues or have suggestions for improvements, feel free to create a pull request or submit an issue.

## Follow Me

You can follow me on LinkedIn and GitHub for more updates and projects:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/nidhinbabukuttan/)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?style=for-the-badge&logo=github)](https://github.com/Man-of-Mischief)


   
