module "rgs" {
  source = "../child-modules/resource-group"
  test1  = var.set1
}
module "vnt" {
  depends_on = [module.rgs]
  source     = "../child-modules/vnet"
  test2      = var.set2
}
module "sbnt" {
  depends_on = [module.vnt]
  source     = "../child-modules/subnet"
  test3      = var.set3
}
module "nts" {
  source = "../child-modules/network-security"
  test4  = var.set4
}
module "nsg" {
  depends_on = [module.sbnt]
  source     = "../child-modules/nat-gateway"
  test5      = var.set5
}
module "vms" {
  depends_on = [module.sbnt, module.nts, module.nsg]
  source     = "../child-modules/virtual-machine-scale-set"
  test6      = var.set6
}
module "kv" {
  depends_on = [module.rgs]
  source     = "../child-modules/key-vault"
  test7      = var.set7
}
module "mntr" {
  depends_on = [module.vms]
  source     = "../child-modules/monitoring"
  test8      = var.set8
}
module "dbs" {
  depends_on = [module.sbnt]
  source     = "../child-modules/database"
  test9      = var.set9
}
module "apg" {
  depends_on = [module.vms, module.sbnt]
  source     = "../child-modules/application-gateway"
  test10     = var.set10
}


module "bstn" {
  depends_on = [module.sbnt]
  source     = "../child-modules/azure-bastion"
  test11     = var.set11
}