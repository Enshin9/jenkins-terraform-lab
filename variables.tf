variable "vpc_cidr" {
   description = "vpc cidr"
   type = string 
}
variable "vpc_name" {
   description = "vpc name tag"
   type = string 
}
variable "subnet_cidr" {
   description = "subnet cidr"
   type = string 
}
variable "subnet_name" {
   description = "subnet name tag"
   type = string 
}
variable "ec2_name" {
   description = "ec2 name tag"
   type = string 
}
variable "igw_name" {
   description = "igw name tag"
   type = string
}
variable "routetable_name" {
   description = "rtb name tag"
   type = string
}
variable "sg_name" {
   description = "sg name tag"
   type = string 
}
variable "ami_id" {
   description = "ami id"
}