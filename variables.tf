variable "vsphere_user" {
  description = "Usuário para autenticação no vSphere"
  type        = string
}

variable "vsphere_password" {
  description = "Senha para autenticação no vSphere"
  type        = string
  sensitive   = true # Marked as sensitive to hide it in logs
}

variable "vsphere_server" {
  description = "Endereço do servidor vSphere"
  type        = string
}

variable "datacenter" {
  description = "Nome do Datacenter"
  type        = string
}

variable "datastore" {
  description = "Nome do Datastore"
  type        = string
}

variable "cluster" {
  description = "Nome do Cluster"
  type        = string
}

variable "network" {
  description = "Nome da Rede"
  type        = string
}

variable "template_name" {
  description = "Nome do Template"
  type        = string
}

variable "vm_name" {
  description = "Nome da Máquina Virtual"
  type        = string
}

variable "num_cpus" {
  description = "Número de CPUs"
  type        = number
}

variable "memory_mb" {
  description = "Memória em MB"
  type        = number
}
