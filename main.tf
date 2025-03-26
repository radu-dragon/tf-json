terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

data "http" "json_data" {
  url = "https://raw.githubusercontent.com/json-iterator/test-data/refs/heads/master/large-file.json"

}

locals {
  json_content = jsondecode(data.http.json_data.response_body)
}

output "json_data" {
  value     = local.json_content
  sensitive = false
}

output "json_first_element" {
  value = try(local.json_content[0], "No elements found or invalid JSON format")
}

resource "local_file" "json_output" {
  content  = data.http.json_data.response_body
  filename = "${path.module}/output.json"
}
