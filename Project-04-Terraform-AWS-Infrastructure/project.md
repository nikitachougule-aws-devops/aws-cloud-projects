# AWS Project 4 – Terraform AWS Infrastructure

## Project Overview

This project demonstrates how to provision AWS infrastructure using **Terraform**, an Infrastructure as Code (IaC) tool. Instead of creating resources manually through the AWS Management Console, Terraform automates the deployment of networking and compute resources using declarative configuration files.

The infrastructure includes a custom VPC, public subnet, internet gateway, route table, security group, and an EC2 instance running an Apache web server.

---

## Architecture

```text
                    Internet
                        │
                Internet Gateway
                        │
                  Route Table
                        │
                 Public Subnet
                        │
          ┌────────────────────────┐
          │      EC2 Instance       │
          │   Amazon Linux 2023     │
          └────────────────────────┘
                        │
                 Security Group
                        │
                      VPC
```

---

## AWS Services Used

- Amazon VPC
- Amazon EC2
- Security Groups
- Internet Gateway
- Route Tables
- Elastic IP
- AWS CLI

---

## Technologies Used

- Terraform
- AWS
- Linux
- Git
- GitHub
- Apache HTTP Server

---

## Project Structure

```text
Project-04-Terraform-AWS-Infrastructure/
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── userdata.sh
├── .gitignore
├── README.md
```

---

## Prerequisites

Before running this project, ensure you have:

- AWS Account
- AWS CLI installed and configured
- Terraform installed
- Git installed
- EC2 Key Pair created

Verify installations:

```bash
terraform -version
aws --version
git --version
```

---

## Configure AWS Credentials

```bash
aws configure
```

Enter:

- AWS Access Key
- AWS Secret Access Key
- Region
- Output Format

Verify:

```bash
aws sts get-caller-identity
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform provisions:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance
- Elastic IP

---

## Verify Deployment

After deployment, verify the following resources in the AWS Console:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

---

## Access the EC2 Instance

Linux/macOS:

```bash
ssh -i terraform-key.pem ec2-user@<PUBLIC_IP>
```

Windows PowerShell:

```powershell
ssh -i .\terraform-key.pem ec2-user@<PUBLIC_IP>
```

---

## View the Web Server

Open your browser and navigate to:

```text
http://<PUBLIC_IP>
```

You should see the Apache welcome page created by the `userdata.sh` script.

---

## View Terraform Outputs

```bash
terraform output
```

Example:

```text
instance_id
public_ip
public_dns
elastic_ip
vpc_id
subnet_id
security_group_id
```

---

## Destroy Infrastructure

To avoid AWS charges:

```bash
terraform destroy
```

Type:

```text
yes
```


---

## Learning Outcomes

Through this project, I learned how to:

- Provision AWS infrastructure using Terraform
- Create a custom VPC
- Configure public networking
- Manage Security Groups
- Launch EC2 instances
- Automate software installation using User Data
- Use Terraform variables and outputs
- Deploy and destroy infrastructure safely
- Manage Infrastructure as Code using Git and GitHub

---

## Useful Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform show
terraform output
terraform destroy
```

---

## Future Enhancements

- Use Terraform Modules
- Store Terraform State in Amazon S3
- Enable State Locking with DynamoDB
- Deploy Auto Scaling Groups
- Configure an Application Load Balancer
- Add Amazon RDS
- Build a production-ready multi-tier architecture