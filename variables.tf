variable "instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "t3.micro"
}

# Node
variable "node_ami" {
  type = string
}

# Public IP
variable "webserver_priv_ip" {
  type    = string
  default = "172.31.0.10"
}

variable "webserver_sg" {
  type    = list(string)
  default = ["sg-039adcdc5ee0b8fc9"]
}

# Public Subnet
variable "webserver_subnet" {
  type    = string
  default = "subnet-0a16a1659d43770ed"
}