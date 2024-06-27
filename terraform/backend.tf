terraform {
  backend "azurerm" {
   resource_group_name  = "WireAppsVM"
    storage_account_name = "statestoragewireappsvm"
    container_name       = "devops-challenge-apps-vm"
    key                  = "prod.terraform.devops-challenge-apps"
    client_id            = "00c0d4e4-1897-464e-9334-3c379739f151"
    client_secret        = "1H38Q~.y0X8fI7Tieso82dRXiP4jXdjj0AaaQb9H"
    subscription_id      = "219984c5-3b06-4014-b50f-7265afea5741"
    tenant_id            = "7ab28136-5b0b-41bf-bc89-091246697252"
  }
}