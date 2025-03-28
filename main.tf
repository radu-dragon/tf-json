terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

data "http" "json_data" {
  url = var.json_url

  # Optional: Handle authentication if needed
  request_headers = var.github_token != "" ? {
    Accept        = "application/json"
    Content-Type  = "application/json"
    Authorization = "token ${var.github_token}"
  } : {
    Accept        = "application/json"
    Content-Type  = "application/json"
  }
}

locals {
  # Parse the JSON response body
  json_content = jsondecode(data.http.json_data.response_body)
}

output "json_data" {
  value     = local.json_content
  sensitive = false
}

# If you want to output specific elements from the JSON
output "json_first_element" {
  value = try(local.json_content[0], "No elements found or invalid JSON format")
}

# Optional: Write the JSON to a local file
# Commented out to improve performance in pipeline environments
# resource "local_file" "json_output" {
#   content  = data.http.json_data.response_body
#   filename = "${path.module}/output.json"
# }