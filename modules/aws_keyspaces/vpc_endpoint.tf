##################
# Security Group VPC Endpoint
#####

resource "aws_security_group" "keyspaces_sg_vpc_endpoint" {
  name        = "${var.project_owner}-${var.project}-endpoint-${var.datacenter}"
  description = "Security Group to allow EC2 access to VCP Endpoint Cassandra"
  vpc_id      = var.keyspaces_vpc_id

  ingress {
    description = "Allow EC2 access to VCP Endpoint Cassandra"
    from_port   = 9142
    to_port     = 9142
    protocol    = "tcp"
    cidr_blocks = [var.keyspaces_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project      = var.project
    ProjectOwner = var.project_owner
    Multidc      = var.datacenter
    application  = "sabrina-keyspaces-demo"
  }
}


##################
# Vpc Endpoint
#####

resource "aws_vpc_endpoint" "tf-keyspaces-endpoint" {
  vpc_id            = var.keyspaces_vpc_id
  service_name      = "com.amazonaws.${var.region}.cassandra"
  vpc_endpoint_type = "Interface"
  subnet_ids = [var.keyspaces_subnet_id]

  security_group_ids = [aws_security_group.keyspaces_sg_vpc_endpoint.id]

  private_dns_enabled = true

  tags = {
    Project      = var.project
    ProjectOwner = var.project_owner
    Multidc      = var.datacenter
    application  = "sabrina-keyspaces-demo"
  }
}