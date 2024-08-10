terraform {

  cloud {
    organization = "packituz-Inc"

    workspaces {
      name = "home-server-docs"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}