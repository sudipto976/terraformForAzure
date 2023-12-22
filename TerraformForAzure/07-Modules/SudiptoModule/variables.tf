variable "azregion" {
  type        = string
  description = "This is azure region"
  default     = "EastUS"
}

variable "storagename" {
  type        = string
  description = "This is azure storage"
  default     = "fjgnudgsihjhdgsk"
}

variable "accesstier" {
  type        = string
  description = "This is azure storage access tier"
  default     = "Standard"
}

variable "replicationtype" {
  type        = string
  description = "This is azure replication type"
  default     = "LRS"
}
