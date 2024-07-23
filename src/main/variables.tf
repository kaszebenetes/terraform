variable "region" {
  type    = string
  default = "UK South"
}

variable "tags" {
  type = map(string)
  default = {
      Name  = "tf-main"
      Environment = "prod"
    }
}
