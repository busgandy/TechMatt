
output "public_subnet_ids_" {
  description = "The IDs of the public subnets."
  value = aws_subnet.public.*.id
}

output "private_subnet_ids_" {
  description = "The IDs of the private subnets."
  value = aws_subnet.private.*.id
}
