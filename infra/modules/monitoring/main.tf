resource "azurerm_monitor_action_group" "main" {
  name                = "ag-${var.prefix}"
  resource_group_name = var.resource_group_name
  short_name          = "vmalerts"

  email_receiver {
    name          = "admin"
    email_address = var.alert_email
  }
}

resource "azurerm_monitor_metric_alert" "cpu" {
  name                = "alert-cpu-${var.prefix}"
  resource_group_name = var.resource_group_name
  scopes              = [var.vm_id]
  description         = "Alerts when average CPU exceeds 80% over 5 minutes"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "availability" {
  name                = "alert-availability-${var.prefix}"
  resource_group_name = var.resource_group_name
  scopes              = [var.vm_id]
  description         = "Alerts when VM availability drops"
  severity            = 1
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "VmAvailabilityMetric"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = var.tags
}