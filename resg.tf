#keyword      function              name of function  -- this is not for production, tf RG name
# resource "azurerm_resource_group" "prem-rsgrp" {
# Actual azure resourc group name
# name = "prem-resource-group1"
# location = "Central US"
# }
#using existing resources group
data "azurerm_resource_group" "prem-existing-rsgrp" {
name = "azure-manual-resourcegroup"
}