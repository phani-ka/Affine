resource "aws_instance" "webapp" {
  ami   = lookup(var.amis, var.aws_region)
  count = "${var.env == "dev" ? 1: 0}"
  #count = length(var.publicsubnetterra)
  #availability_zone           = var.vmavailability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = "${element(var.pub_subnets, count.index + 1)}"
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  tags = {
    Name = "${var.env}-devserver"
  }
  

}