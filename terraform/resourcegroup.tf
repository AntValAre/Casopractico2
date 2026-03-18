resource "azurerm_resource_group" "rg" {
        name = "TerraformaCT"
        location = "France Central"
}

  tags = {
    environment = "casopractico2"
  }