# JSON Fetcher Terraform Module

This Terraform module fetches a JSON file from a URL and outputs its content. It can be used to integrate external JSON data into your Terraform workflows.

## Usage

```hcl
module "json_fetcher" {
  source = "path/to/this/module"
  
  # Optional: Override the default URL
  json_url = "https://your-custom-json-url.com/data.json"
  
  # Optional: Provide a token for authenticated requests
  github_token = "your-github-token"
}

# Access the JSON data
output "fetched_data" {
  value = module.json_fetcher.json_data
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| json_url | URL of the JSON file to fetch | `string` | `"https://raw.githubusercontent.com/json-iterator/test-data/refs/heads/master/large-file.json"` | no |
| github_token | GitHub token for authenticated requests | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| json_data | The complete parsed JSON data |
| json_first_element | The first element of the JSON array (if applicable) |

## Notes

- For very large JSON files, consider using the `sensitive = true` flag on outputs to prevent the data from being printed in logs.
- This module also creates a local file `output.json` containing the fetched JSON data.
- Ensure your Terraform environment has proper network access to reach the specified URL.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| http | ~> 3.0 |
| local | >= 2.0.0 |

## License

MIT