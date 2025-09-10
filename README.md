# Terraform-Vcenter-Template
Create VM using Terraform and template VM

# Terraform vSphere Template Deployment

This project uses Terraform to deploy a virtual machine (VM) on a vSphere environment based on a pre-existing template.

## Prerequisites

1. **Terraform**: Install Terraform on your system. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
2. **vSphere Access**: Ensure you have access to a vSphere environment with the necessary permissions to create VMs.
3. **VM Template**: A VM template must already exist in the vSphere environment.

## Files in the Project

- **`main.tf`**: Contains the Terraform configuration for deploying the VM.
- **`variables.tf`**: Defines the input variables used in the Terraform configuration.

## Variables

The following variables are used in the configuration:

| Variable          | Description                          | Example Value         |
|--------------------|--------------------------------------|-----------------------|
| `vsphere_user`     | vSphere username                    | `admin`               |
| `vsphere_password` | vSphere password                    | `password123`         |
| `vsphere_server`   | vSphere server address              | `vcenter.example.com` |
| `datacenter`       | Name of the datacenter              | `Datacenter1`         |
| `datastore`        | Name of the datastore               | `Datastore1`          |
| `cluster`          | Name of the compute cluster         | `Cluster1`            |
| `network`          | Name of the network                 | `VM Network`          |
| `template_name`    | Name of the VM template             | `Ubuntu-Template`     |
| `vm_name`          | Name of the VM to create            | `MyNewVM`             |
| `num_cpus`         | Number of CPUs for the VM           | `2`                   |
| `memory_mb`        | Memory size in MB for the VM        | `4096`                |

## Steps to Deploy

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd Terraform-Vcenter-Template
   ```

2. **Set Environment Variables**:  
   Export sensitive variables like `vsphere_user` and `vsphere_password` as environment variables:
   ```bash
   export TF_VAR_vsphere_user="your-username"
   export TF_VAR_vsphere_password="your-password"
   export TF_VAR_vsphere_server="your-vsphere-server"
   ```

3. **Define Other Variables**:  
   Create a `terraform.tfvars` file to define the remaining variables:
   ```terraform
   datacenter    = "Datacenter1"
   datastore     = "Datastore1"
   cluster       = "Cluster1"
   network       = "VM Network"
   template_name = "Ubuntu-Template"
   vm_name       = "MyNewVM"
   num_cpus      = 2
   memory_mb     = 4096
   ```

4. **Initialize Terraform**:  
   Run the following command to initialize Terraform:
   ```bash
   terraform init
   ```

5. **Plan the Deployment**:  
   Preview the changes Terraform will make:
   ```bash
   terraform plan
   ```

6. **Apply the Deployment**:  
   Deploy the VM:
   ```bash
   terraform apply
   ```

7. **Verify the Deployment**:  
   Check your vSphere environment to ensure the VM has been created successfully.

