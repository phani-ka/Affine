resource "aws_instance" "webapp" {
  ami   = lookup(var.amis, var.aws_region)
  count = "${var.env == "dev" ? 1: 0}"
  #count = length(var.publicsubnetterra)
  #availability_zone           = var.vmavailability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = "${element(aws_subnet.subnet-public.*.id, count.index)}"
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name = "devserver"
  }
  depends_on = [aws_security_group.allow_all]

}