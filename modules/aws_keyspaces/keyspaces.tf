##################
# Keyspaces sabrina-keyspaces-demo
#####

resource "aws_keyspaces_keyspace" "sabrina" {
  name = "sabrina_demo"
  tags = {
    Project      = var.project
    ProjectOwner = var.project_owner
    Multidc      = var.datacenter
    application  = "sabrina-keyspaces-demo"
  }
}

resource "aws_keyspaces_table" "demontracao" {
  keyspace_name = aws_keyspaces_keyspace.sabrina.id
  table_name    = "demontracao"

  schema_definition {
    column {
      name = "user"
      type = "text"
    }

    column {
      name = "email"
      type = "int"
    }

    column {
      name = "cargo"
      type = "int"
    }

    column {
      name = "hr"
      type = "timestamp"
    }

    partition_key {
      name = "user"
    }

    clustering_key {
      name = "hr"
      order_by = "ASC"
    }

  }
  point_in_time_recovery {
    status = var.keyspaces_backup_off
  }
  
  tags = {
    Project      = var.project
    ProjectOwner = var.project_owner
    Multidc      = var.datacenter
    application  = "sabrina-keyspaces-demo"
  }
}