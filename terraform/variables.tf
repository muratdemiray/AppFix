variable "region" {
  default = "us-east-2"
}

variable "cluster_name" {
  type    = string
  default = "AppFix-cluster"
}

variable "kubeconfig_path" {
  type    = string
  default = "../../"
}
