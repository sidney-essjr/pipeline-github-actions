variable "aws_key_pub" {
  description = "Chave pública para acesso a máquina na AWS"
  type        = string
}

variable "azure_key_pub" {
  description = "Chave pública para acesso a máquina na Azure"
  type        = string
}

variable "azure_location" {
  description = "Região onde os recursos serão criados na Azure"
  type        = string
  default     = "Brazil South"
}

variable "aws_location" {
  description = "Região onde os recursos serão criados na AWS"
  type        = string
  default     = "sa-east-1"
}