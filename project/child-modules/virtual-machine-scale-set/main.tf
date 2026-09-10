resource "azurerm_linux_virtual_machine_scale_set" "exvmss" {
    for_each = var.test6
  name                = each.value.vmss_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  instances           = each.value.instances
  admin_username      = each.value.admin_username

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.public_key
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.image_sku
    version   = each.value.version
  }

  os_disk {
    storage_account_type = each.value.storage_account_type
    caching              = each.value.caching
  }

  network_interface {
    name    = each.value.network_interface_name
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.vmss_subnet[each.key].id
    }
  }
}