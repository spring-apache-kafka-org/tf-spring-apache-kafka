resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name       = "${var.env}-vpc"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name       = "${var.env}-igw"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    "Name"                                                 = "${var.env}-private-subnet-${var.availability_zones[count.index]}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"     = "owned"
    Owner                                                  = var.owner
    Discipline                                             = var.discipline
    Purpose                                                = var.purpose
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${var.env}-public-${var.availability_zones[count.index]}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"     = "owned"
    Owner                                                  = var.owner
    Discipline                                             = var.discipline
    Purpose                                                = var.purpose
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name       = "${var.env}-eip"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name       = "${var.env}-nat-gw"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name       = "${var.env}-private-rt"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name       = "${var.env}-public-rt"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_route_table_association" "private_rt_assn" {
  count         = length(var.private_subnet_cidrs)
  subnet_id     = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "public_rt_assn" {
  count         = length(var.public_subnet_cidrs)
  subnet_id     = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}