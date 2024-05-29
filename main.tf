module "dynamodb" {
    source = "./modules/dynamodb"
  name           = "my-table"
  hash_key       = "BrandName"
  range_key      = "ModelNumber"

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
  ttl_enabled = false
  ttl_attribute_name = "TimeToExist"


#   name     = "my-table"
#   hash_key = "id"

#   attributes = [
#     {
#       name = "id"
#       type = "N"
#     }
#   ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}