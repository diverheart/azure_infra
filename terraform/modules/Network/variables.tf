variable "vn_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
 
}

variable "rg_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  
}

variable "ng_id" {
  description = "NSG ID"
  type = string 
}

variable "ni_name" {
  description = "Network Interface name"
  type = string
}