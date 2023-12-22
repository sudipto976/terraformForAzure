output "primarykey" {
  value     = values(azurerm_storage_account.mystorgae)[0].primary_access_key
  sensitive = true
}

output "host" {
  value = values(azurerm_storage_account.mystorgae)[1].primary_blob_host
}
