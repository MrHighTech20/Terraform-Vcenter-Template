provider "vsphere" {
    user           = var.vsphere_user          # Username for vSphere authentication
    password       = var.vsphere_password      # Password for vSphere authentication
    vsphere_server = var.vsphere_server        # vSphere server address

    allow_unverified_ssl = true                # Allow insecure SSL connections (useful for self-signed certificates)
}

# Fetch the datacenter information
data "vsphere_datacenter" "dc" {
    name = var.datacenter                      # Name of the datacenter to use
}

# Fetch the datastore information
data "vsphere_datastore" "datastore" {
    name          = var.datastore              # Name of the datastore to use
    datacenter_id = data.vsphere_datacenter.dc.id # Datacenter ID fetched from the datacenter data source
}

# Fetch the compute cluster information
data "vsphere_compute_cluster" "cluster" {
    name          = var.cluster                # Name of the compute cluster to use
    datacenter_id = data.vsphere_datacenter.dc.id # Datacenter ID fetched from the datacenter data source
}

# Fetch the virtual machine template information
data "vsphere_virtual_machine" "template" {
    name          = var.template_name          # Name of the VM template to use
    datacenter_id = data.vsphere_datacenter.dc.id # Datacenter ID fetched from the datacenter data source
}

# Fetch the network information
data "vsphere_network" "network" {
    name          = var.network                # Name of the network to use
    datacenter_id = data.vsphere_datacenter.dc.id # Datacenter ID fetched from the datacenter data source
}

# Define the virtual machine resource
resource "vsphere_virtual_machine" "vm" {
    name             = var.vm_name             # Name of the virtual machine to create
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id # Resource pool ID fetched from the cluster data source
    datastore_id     = data.vsphere_datastore.datastore.id # Datastore ID fetched from the datastore data source

    num_cpus = var.num_cpus                    # Number of CPUs for the VM
    memory   = var.memory_mb                   # Memory (in MB) for the VM
    guest_id = data.vsphere_virtual_machine.template.guest_id # Guest OS ID fetched from the template

    # Configure the disk for the VM
    disk {
        label            = "disk0"             # Label for the disk
        size             = data.vsphere_virtual_machine.template.disks.0.size # Disk size fetched from the template
        eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub # Eager scrub setting from the template
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned # Thin provisioning setting from the template
    }

    # Configure the network interface for the VM
    network_interface {
        network_id   = data.vsphere_network.network.id # Network ID fetched from the network data source
        adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0] # Adapter type fetched from the template
    }

    # Clone the VM from the specified template
    clone {
        template_uuid = data.vsphere_virtual_machine.template.id # Template UUID fetched from the template data source
    }
}