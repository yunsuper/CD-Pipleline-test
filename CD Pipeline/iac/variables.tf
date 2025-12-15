variable "namespace" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "node_port" {
  type = number
}

variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}
