# Controls if DynamoDB table and associated resources are created
create_table = true

# Name of the DynamoDB table
name = "example-dynamodb-table"

# List of nested attribute definitions
attributes = [
  {
    name = "id"
    type = "S"
  },
  {
    name = "timestamp"
    type = "N"
  }
]

# The attribute to use as the hash (partition) key
hash_key = "id"

# The attribute to use as the range (sort) key
range_key = "timestamp"

# Controls how you are billed for read/write throughput and how you manage capacity
billing_mode = "PAY_PER_REQUEST"

# The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0
write_capacity = null

# The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0
read_capacity = null

# Whether to enable point-in-time recovery
point_in_time_recovery_enabled = true

# Indicates whether ttl is enabled
ttl_enabled = true

# The name of the table attribute to store the TTL timestamp in
ttl_attribute_name = "ttl"

# Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc.
global_secondary_indexes = [
  {
    name            = "GSI1"
    hash_key        = "gsi1_hash_key"
    range_key       = "gsi1_range_key"
    projection_type = "ALL"
  }
]

# Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource.
local_secondary_indexes = [
  {
    name            = "LSI1"
    range_key       = "lsi1_range_key"
    projection_type = "ALL"
  }
]

# Region names for creating replicas for a global DynamoDB table.
replica_regions = ["us-east-1", "us-west-2"]

# Indicates whether Streams are to be enabled (true) or disabled (false).
stream_enabled = true

# When an item in the table is modified, StreamViewType determines what information is written to the table's stream
stream_view_type = "NEW_AND_OLD_IMAGES"

# Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)
server_side_encryption_enabled = true

# The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb.
server_side_encryption_kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-5678-90ab-cdef-1234567890ab"

# A map of tags to add to all resources
tags = {
  Environment = "production"
  Project     = "example-project"
}

# Updated Terraform resource management timeouts
timeouts = {
  create = "15m"
  update = "60m"
  delete = "15m"
}

# Whether or not to enable autoscaling. See note in README about this setting
autoscaling_enabled = true

# A map of default autoscaling settings
autoscaling_defaults = {
  scale_in_cooldown  = 60
  scale_out_cooldown = 60
  target_value       = 70
}

# A map of read autoscaling settings. `max_capacity` is the only required key. See example in examples/autoscaling
autoscaling_read = {
  min_capacity = 1
  max_capacity = 10
  target_value = 70
}

# A map of write autoscaling settings. `max_capacity` is the only required key. See example in examples/autoscaling
autoscaling_write = {
  min_capacity = 1
  max_capacity = 10
  target_value = 70
}

# A map of index autoscaling configurations. See example in examples/autoscaling
autoscaling_indexes = {
  GSI1 = {
    read = {
      min_capacity = 1
      max_capacity = 10
      target_value = 70
    }
    write = {
      min_capacity = 1
      max_capacity = 10
      target_value = 70
    }
  }
}

# The storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS
table_class = "STANDARD"

# Enables deletion protection for table
deletion_protection_enabled = true

# Configurations for importing s3 data into a new table.
import_table = {
  s3_bucket       = "example-bucket"
  s3_key          = "example-key"
  import_manifest = "example-manifest"
}

# Whether to ignore changes lifecycle to global secondary indices, useful for provisioned tables with scaling
ignore_changes_global_secondary_index = true
