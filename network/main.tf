resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge({
    Name = "${var.common_tags["project"]}-${var.common_tags["environment"]}"
  }, var.common_tags, )
}

resource "aws_subnet" "public" {
  for_each                = toset(var.public_subnet_cidrs)
  cidr_block              = each.value
  vpc_id                  = aws_vpc.main.id
  tags = merge({
    Name = "${var.common_tags["project"]}-${var.common_tags["environment"]}-public"
  }, var.common_tags, )
}

resource "aws_subnet" "private" {
  for_each                = toset(var.private_subnet_cidrs)
  cidr_block              = each.value
  vpc_id                  = aws_vpc.main.id
  tags = merge({
    Name = "${var.common_tags["project"]}-${var.common_tags["environment"]}-private"
  }, var.common_tags, )
}
