provider "azurerm" {
  features {}
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "AdminUsername"
  key_vault_id = "/subscriptions/edcc2f72-6799-49db-b170-9e67144fa439/resourceGroups/mbirn_demo/providers/Microsoft.KeyVault/vaults/dev.terraform.tfstate"
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "AdminPassword"
  key_vault_id = "/subscriptions/edcc2f72-6799-49db-b170-9e67144fa439/resourceGroups/mbirn_demo/providers/Microsoft.KeyVault/vaults/dev.terraform.tfstate"
}

resource "azurerm_virtual_machine" "mbirn_demo" {
  # Other VM configuration here
  name                  = "demo-vm"
  location              = "East US"
  resource_group_name   = "your-resource-group"
  network_interface_ids = [azurerm_network_interface.mbirn_demo.id]
  vm_size               = "Standard_DS2_v2"

  os_profile {
    computer_name  = "examplevm"
    admin_username = data.azurerm_key_vault_secret.admin_username.value
    admin_password = data.azurerm_key_vault_secret.admin_password.value
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


