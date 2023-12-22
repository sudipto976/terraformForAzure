module "sudiptomodule" {
  source = "./SudiptoModule"

}

output "resource_primary_key" {
  value     = module.sudiptomodule.priamrykey
  sensitive = true
}
