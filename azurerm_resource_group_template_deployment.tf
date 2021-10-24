resource "azurerm_resource_group_template_deployment" "acre_cluster" {
  name                = "redisgeek-migration"
  resource_group_name = random_string.resource_group_name.id
  deployment_mode     = var.acre_deployment_mode
  template_content = templatefile(var.acre_template_path_1,
    {
      acre_name_1          = format("%s-%s", random_string.acre_group_name.id, var.primary-region),
      acre_name_2          = format("%s-%s", random_string.acre_group_name.id, var.secondary-region),
      location             = var.primary-region,
      location_2           = var.secondary-region
      acre_sku             = var.acre_sku,
      acre_capacity        = var.acre_capacity,
      acre_client_protocol = var.acre_client_protocol,
      acre_eviction_policy = var.acre_eviction_policy,
      acre_cluster_policy  = var.acre_cluster_policy,
      acre_group_nickname  = random_string.acre_group_name.id,
      subscription_id      = data.azurerm_subscription.current.subscription_id,
      resource_group_name  = random_string.resource_group_name.id,
  })
}