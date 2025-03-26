# Optional: Define variables if you need to parameterize URLs or add tokens
variable "json_url" {
  description = "URL to the JSON file to fetch"
  type        = string
  default     = "https://raw.githubusercontent.com/json-iterator/test-data/refs/heads/master/large-file.json"
}

# Optional: For authentication if needed
variable "github_token" {
  description = "GitHub token for authenticated requests"
  type        = string
  default     = ""
  sensitive   = true
}