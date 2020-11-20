resource "aws_elasticache_subnet_group" "subnet-group-elasticache" {
  name       = "subnet-group-elasticache"
  subnet_ids = [for s in data.aws_subnet.subnets-main-vpc : s.id] 
}

resource "aws_elasticache_cluster" "elasticache-cluster-plataforma-a" {
  cluster_id           = "elasticache-cluster-plataforma-a"
  engine               = "redis"
  node_type            = var.elasticache_node_type
  num_cache_nodes      = 1  
  engine_version       = "5.0.6"
  port                 = 6379

  subnet_group_name    = aws_elasticache_subnet_group.subnet-group-elasticache.name

  security_group_ids   = [aws_security_group.sg-elasticache-cluster.id]

  depends_on = [
    aws_security_group.sg-elasticache-cluster,
  ]
}