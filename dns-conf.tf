
# IBM Cloud Resource Group the CIS instance will be created under
resource "ibm_resource_group" "web_group" {
  name = var.resource_group
}

resource "ibm_cis" "web_domain" {
  name              = "web_domain"
  resource_group_id = ibm_resource_group.web_group.id
  plan              = "standard"
  location          = "global"
}

resource "ibm_cis_domain_settings" "web_domain" {
  cis_id          = ibm_cis.web_domain.id
  domain_id       = ibm_cis_domain.web_domain.id
  waf             = "on"
  ssl             = "flexible"
  min_tls_version = "1.2"
}

resource "ibm_cis_domain" "web_domain" {
  cis_id = ibm_cis.web_domain.id
  domain = var.domain
}
