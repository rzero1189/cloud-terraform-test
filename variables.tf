variable "virginia_cidr" {
  description = "CDIR Virginia"
  type        = string
  sensitive   = false
}

/*
variable "public_subnet" {
  description = "CDIR public subnet"
  type        = string
}

variable "private_subtnet" {
  description = "CDIR private subnet"
  type        = string
}
*/

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CDIR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = bool
}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type        = list(number)
}
