variable "kubeconfig_path" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "node_port" {
  type = number
}
