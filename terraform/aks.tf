resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "akscasopractico2" 
  sku_tier   = "Standard"         

  default_node_pool {
    name       = "default"
    node_count = 1                  
    vm_size    = "Standard_B2s_v2"     
  }

  identity {
    type = "SystemAssigned" 
  }

  tags = {
    environment = "casopractico2"
  }
}

resource "azurerm_role_assignment" "ra-perm" {
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name             = "AcrPull"

  # NOTA: Cambia "azurerm_container_registry.acr.id" por el nombre exacto que le hayas puesto a tu recurso ACR en el archivo acr.tf [cite: 611, 612]
  scope                            = azurerm_container_registry.acr.id 
  
  # (Opcional) A veces Terraform requiere esto para evitar errores de timing en la creación de identidades
  skip_service_principal_aad_check = true 
}