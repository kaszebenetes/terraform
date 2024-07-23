variable "region" {
  type    = string
  default = "UK South"
}

variable "tags" {
  type = map(string)
  default = {
      Name  = "tf-shared-services"
      Environment = "prod"
    }
}
