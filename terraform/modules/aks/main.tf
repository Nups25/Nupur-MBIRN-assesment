module "aks" {
  source              = "Azure/kubernetes/aks"
  resource_group_name = module.rg.name
  cluster_name        = "demo-aks"
  location            = module.rg.location
  dns_prefix          = "demo-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }
}