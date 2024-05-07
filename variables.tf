variable "enable" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "repository_name" {
  type        = string
  default     = ""
  description = <<-EOT
The name to use for the repository.
The repository name may be specified on its own (such as `nginx-web-app`) or it can be prepended with a namespace to group the repository into a category (such as `project-a/nginx-web-app`).
If you don't specify a name, CFNlong generates a unique physical ID and uses that ID for the repository name. For more information, see Name type.
The repository name must start with a letter and can only contain lowercase letters, numbers, hyphens, underscores, and forward slashes.
If you specify a name, you cannot perform updates that require replacement of this resource.
You can perform updates that require no or some interruption.
If you must replace the resource, specify a new name.
  EOT
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags map for resources"
}

variable "enable_private_ecr" {
  type        = bool
  default     = false
  description = "Set to false to prevent the module from creating any resources."
}

variable "max_image_count" {
  type        = number
  default     = 10
  description = "How many Docker Image versions AWS ECR will store."
}

variable "max_untagged_image_count" {
  type        = number
  default     = 1
  description = "How many Untagged Docker Image versions AWS ECR will store."
}

variable "principals_readonly_access" {
  type        = list(any)
  default     = []
  description = "Principal ARN to provide with readonly access to the ECR."
}

variable "principals_full_access" {
  type        = list(any)
  description = "Principal ARN to provide with full access to the ECR."
  default     = []
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default     = true
}

variable "image_tag_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "The tag mutability setting for the repository."
}

variable "repository_force_delete" {
  type        = bool
  default     = false
  description = "If `true`, will delete the repository even if it contains images. Defaults to `false`"
}

variable "encryption_type" {
  type        = string
  default     = "KMS"
  description = "The encryption type for the repository. Must be one of: `KMS` or `AES256`. Defaults to `AES256`"
}

variable "kms_key" {
  type        = string
  default     = null
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified, uses the default AWS managed key for ECR"
}

# Timeouts
variable "timeouts" {
  type        = map(any)
  default     = {}
  description = "Timeouts map."
}

# Public Repository
variable "enable_public_ecr" {
  type        = bool
  default     = false
  description = "Set to false to prevent the module from creating any resources."
}

variable "public_repository_catalog_data" {
  description = "Catalog data configuration for the repository"
  type        = any
  default     = {}
}
