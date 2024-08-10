resource "cloudflare_pages_project" "home_server_docs_page" {
  account_id        = var.cloudflare_account_id
  name              = "home-server-docs"
  production_branch = "master"

  build_config {
    build_command   = "mkdocs build"
    destination_dir = "site"
  }

  source {
    type = "github"
    config {
      owner                         = "packituz-gttz"
      repo_name                     = "home-server-docs"
      production_branch             = "master"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_branch_excludes       = ["renovate/configure"]
    }
  }

  deployment_configs {
    production {
      environment_variables = {
        PYTHON_VERSION = "3.11.5"
      }
    }
  }
}

resource "cloudflare_pages_domain" "home_server_docs_domain" {
  account_id   = var.cloudflare_account_id
  domain       = "home-docs.packituz.dev"
  project_name = cloudflare_pages_project.home_server_docs_page.name
}

resource "cloudflare_record" "home_server_docs" {
  name    = "home-docs"
  type    = "CNAME"
  value   = cloudflare_pages_project.home_server_docs_page.subdomain
  zone_id = var.cloudflare_zone_id
  proxied = true
}

output "url" {
  value = cloudflare_pages_project.home_server_docs_page.subdomain
}