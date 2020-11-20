resource "aws_security_group" "sg-elasticache-cluster" {
  name        = "sg_elasticache_cluster_plataformaa"
  description = "Allow access to elasticache service"
  vpc_id      = data.aws_vpc.main-vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "TCP"
    cidr_blocks = [var.vpc_cidr_block]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "ElastiCache"
    env   = var.env
    team  = var.team
  }
}