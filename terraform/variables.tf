variable "rgname" {
  description = "Resource Group Name"
  default     = "mbirn_demo"
  type        = string
}
variable "location" {
  description = "Azure location"
  default     = "East US"
  type        = string
}
variable "sname" {
  description = "Azure Storage Account"
  default = "mbirnsa"
  type        = string
}