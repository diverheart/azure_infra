variable "vn_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
 
}


variable "rg_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "ng_name" {
  description = "Name of the Azure Network Security Group"
  type        = string
}

variable "ni_name" {
  description = "Name of the interface"
  type = string
}