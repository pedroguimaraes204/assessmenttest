# In this file put the variables related to the deployment

variable "azure_location" {
  type        = string
  description = "The Azure region where resources will be deployed."
  default     = "eastus2"
}

variable "project_name" {
  type        = string
  description = "Project base name, used to name resources"
  default     = "rdicidr"
 }