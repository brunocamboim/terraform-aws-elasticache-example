data "aws_vpc" "main-vpc" {
  tags = {
    Name = "main-vpc"
  }
}

data "aws_subnet_ids" "subnets-main-vpc" {
  vpc_id = data.aws_vpc.main-vpc.id
}

data "aws_subnet" "subnets-main-vpc" {
  for_each = data.aws_subnet_ids.subnets-main-vpc.ids
  id       = each.value
}