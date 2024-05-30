module "dynamodb" {
  source                         = "./modules/dynamodb"
  name                           = "my-table"
  hash_key                       = "BrandName"
  range_key                      = "ModelNumber"
  point_in_time_recovery_enabled = true
  server_side_encryption_enabled = false
  attributes = [
    {
      name = "BrandName"
      type = "S"
    },
    {
      name = "ModelNumber"
      type = "N"
    }
  ]
  ttl_enabled        = false
  ttl_attribute_name = "TimeToExist"

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}