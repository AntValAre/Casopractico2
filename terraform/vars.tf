variable "location" {
  type        = string
  default     = "France Central" 
}

variable "resourcegroupname" {
  type        = string
  default     = "rgcasopractico2"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2als_v2"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
}

variable "aks_node_count" {
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  type        = string
  default     = "Standard_B2s"
}
