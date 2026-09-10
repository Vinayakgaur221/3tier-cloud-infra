variable "test9" {
    type = map(object({

    server_name            = string
    resource_group_name    = string
    location               = string
    version                = string

    administrator_login    = string
    administrator_password = string

    zone                   = string

    storage_mb             = number
    storage_tier            = string
    sku_name               = string

    database_name          = string

    
  }))
}