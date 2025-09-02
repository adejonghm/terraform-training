/*
Developed by adejonghm
----------

July 17, 2025
*/

output "tags" {
  description = "Merged tags combining common tags with additional resource-specific tags"
  value       = local.merged_tags
}
