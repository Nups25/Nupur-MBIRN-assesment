provider "azurerm" {
  features {}
}


provider "helm" {
  kubernetesconfig = file("~/.kube/config") # Replace with the path to your kubeconfig file
}

resource "helm_release" "demo_helm" {
  name       = "demo-helm-release"
  namespace  = "default"
  repository = "https://github.com/yourusername/your-helm-chart-repo"
  chart      = "mbirn_demo_helm_chart"
  version    = "1.2.3" 
  
}


resource "azurerm_public_ip" "demo" {
  name                         = "example-public-ip"
  location                     = module.RG.location
  allocation_method            = "Dynamic"
  idle_timeout_in_minutes      = 30
  domain_name_label            = "demo-ip" # This will be part of your public IP's DNS name
}



# Define NSG rule to allow SSH from your IP
resource "azurerm_network_security_group" "ssh_nsg" {
  name                = "ssh-nsg"
  location            = module.RG.location
  resource_group_name = module.RG.name

  security_rule {
    name                       = "ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "YOUR_PUBLIC_IP" # Replace with your public IP address
    destination_address_prefix = "*"
  }
}
