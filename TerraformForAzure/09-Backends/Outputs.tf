output "primarykey" {
  value     = azurerm_storage_account.mystorgae.primary_access_key
  sensitive = true
}

output "host" {
  value = azurerm_storage_account.mystorgae.primary_blob_host
}
