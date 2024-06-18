# Terraform template

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=bugs)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=coverage)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=cdanmontoya_terraform-template&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=cdanmontoya_terraform-template)


This project aims to accelerate Infrastructure as Code practices among my projects. It defines a standard 
way to structure a project using modules as the core abstractions for flexible, multicloud solutions.

## Folder structure

```
.
└── terraform-template/             
    ├── environments/                       # Optional. Useful for production use cases for which you need strong separation between environments
    │   ├── dev/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── ...
    │   └── prod/
    │       ├── main.tf
    │       └── variables.tf
    ├── modules/                            # Reusable abstractions that represent a capability, such as a DSN or a Microservice
    │   ├── example-module-1/
    │   │   ├── main.tf
    │   │   ├── variables.tf
    │   │   └── outputs.tf/
    │   │       ├── aws/                    # Concrete implementation for a specific cloud provider
    │   │       │   ├── main.tf
    │   │       │   ├── variables.tf
    │   │       │   ├── outputs.tf
    │   │       │   └── submodule/
    │   │       │       ├── main.tf
    │   │       │       ├── variables.tf
    │   │       │       └── outputs.tf
    │   │       ├── gcp/
    │   │       │   └── ...
    │   │       └── azure/
    │   │           └── ...
    │   ├── ...
    │   └── example-module-n/
    │       └── ...
    ├── main.tf                             # Entrypoint where modules can be instantiated. Useful for simple environments. Resources can be isolated using terraform workspaces
    ├── variables.tf
    ├── outputs.tf
    ├── README.md
    └── CHANGELOG.md
```

## How to use

### First time run

1. Go to the `main.tf` file at the root folder or the environments folder, depending on your needs.
2. Comment the `backend` section
3. Run `terraform init` and `terraform apply`. This will create a local `tfstate` file with the defined resources.
4. Uncomment the `backend` section
5. Change the `bucket` and `dynamodb_table` attribute values in the `backend` section to match the desired names.
6. Run again `terraform init` and `terraform apply`. You'll be asked if you want to use this local state as the initial remote state, type `yes`, and that's it!.


## References

* [A Comprehensive Guide to Terraform](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca)
* [How to manage Terraform state](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
* [How to create reusable infrastructure with Terraform modules](https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d)