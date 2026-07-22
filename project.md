# Project 05 - IAM Security Lab

## 📌 Project Overview

This project demonstrates how to implement Identity and Access Management (IAM) in AWS. The objective is to learn how to securely manage users, groups, roles, and permissions using AWS IAM.

The project follows the **Principle of Least Privilege**, ensuring users and services receive only the permissions they need.

---

## 🎯 Objectives

- Create IAM Users
- Create IAM Groups
- Assign AWS Managed Policies
- Create a Custom IAM Policy
- Create an IAM Role for EC2
- Enable Multi-Factor Authentication (MFA)
- Configure IAM Password Policy
- Test User Permissions

---

## 🛠 AWS Services Used

- AWS IAM
- Amazon EC2 (for IAM Role testing)
- Amazon S3 (for Custom Policy testing)

---

# Architecture

```text
                    AWS Account
                         │
        ┌────────────────┼────────────────┐
        │                │                │
     IAM Users       IAM Groups      IAM Roles
        │                │                │
     Policies       Policies       EC2 Instance
                                            │
                                            ▼
                                     Amazon S3 Bucket
```

---

# Project Steps

## Step 1 - Open IAM Console

- Login to AWS Console
- Search for IAM
- Open IAM Dashboard


---

## Step 2 - Create IAM Users

Created three users.

| User Name | Purpose |
|------------|----------|
| admin-user | Administrator |
| developer-user | Developer |
| readonly-user | Read Only |

Navigation

```
IAM → Users → Create User

---

## Step 3 - Create IAM Groups

Created three groups.

| Group | Purpose |
|---------|----------|
| Admins | Full Access |
| Developers | Development Access |
| ReadOnly | Read Only Access |

Navigation

```
IAM → User Groups → Create Group


---

## Step 4 - Attach AWS Managed Policies

Assigned policies to each group.

| Group | Policy |
|---------|--------------------------|
| Admins | AdministratorAccess |
| Developers | AmazonEC2FullAccess |
| Developers | AmazonS3FullAccess |
| ReadOnly | ReadOnlyAccess |



---

## Step 5 - Add Users to Groups

| User | Group |
|--------|------------|
| admin-user | Admins |
| developer-user | Developers |
| readonly-user | ReadOnly |



---

## Step 6 - Create Custom IAM Policy

Created a custom policy that allows access to only one S3 bucket.

Policy Name

```
S3LimitedAccessPolicy
```

Policy JSON

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect":"Allow",
            "Action":[
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource":[
                "arn:aws:s3:::my-demo-bucket",
                "arn:aws:s3:::my-demo-bucket/*"
            ]
        }
    ]
}
```



---

## Step 7 - Create IAM Role

Created an IAM Role for EC2.

Trusted Entity

```
AWS Service
```

Use Case

```
EC2
```

Attached Policy

```
AmazonS3ReadOnlyAccess
```

Role Name

```
EC2S3ReadOnlyRole


---

## Step 8 - Enable MFA

Enabled Multi-Factor Authentication for IAM users.

Navigation

```
IAM → Users → Security Credentials → Assign MFA


---

## Step 9 - Configure Password Policy

Configured password policy.

Settings

- Minimum Password Length: 12
- Require Uppercase
- Require Lowercase
- Require Numbers
- Require Symbols



---

## Step 10 - Test Permissions

### ReadOnly User

✅ Can view AWS resources

❌ Cannot create EC2 instance

❌ Cannot delete S3 bucket

---

### Developer User

✅ Can launch EC2

✅ Can create S3 bucket

❌ Cannot manage IAM

---

### Admin User

✅ Full administrative access

---

# Project Folder Structure

```
Project-05-IAM-Security-Lab
│
├── README.md
├── architecture.png
├── screenshots
│   ├── 01-iam-dashboard.png
│   ├── 02-users-created.png
│   ├── 03-groups-created.png
│   ├── 04-managed-policies.png
│   ├── 05-user-group-membership.png
│   ├── 06-custom-policy.png
│   ├── 07-role-created.png
│   ├── 08-mfa.png
│   └── 09-password-policy.png
│
└── policies
      └── S3LimitedAccessPolicy.json
```

---

# Key Learning

- IAM Users
- IAM Groups
- IAM Roles
- IAM Policies
- AWS Managed Policies
- Custom Policies
- Least Privilege Principle
- Multi-Factor Authentication (MFA)
- Password Policy
- Secure AWS Access Management