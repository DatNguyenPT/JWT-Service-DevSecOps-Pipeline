resource "aws_internet_gateway" "main_igw" {
 vpc_id = aws_vpc.main_vpc.id
 
 tags = {
   Name = "Main VPC IGW"
 }
}

 # Access to Internet (0.0.0.0/0) from internet gateway
resource "aws_route_table" "public_route_table" {
 vpc_id = aws_vpc.main_vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.main_igw.id
 }
 
 tags = {
   Name = "Public Access Route Table"
 }
}


# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_route_table.id
}