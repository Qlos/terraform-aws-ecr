output "registry_id" {
  value       = try(aws_ecr_repository.this[0].registry_id, aws_ecrpublic_repository.this[0].registry_id, null)
  description = "Registry ID."
}

output "registry_url" {
  value       = try(aws_ecr_repository.this[0].repository_url, aws_ecrpublic_repository.this[0].repository_uri, null)
  description = "Registry URL."
}

output "repository_name" {
  value       = join("", aws_ecr_repository.this[*].name)
  description = "Registry name."
}

output "arn" {
  value       = try(aws_ecr_repository.this[0].arn, aws_ecrpublic_repository.this[0].arn, null)
  description = "Registry ARN."
}
