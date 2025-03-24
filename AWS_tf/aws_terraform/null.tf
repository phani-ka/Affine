resource "null_resource" "cpfile" {
  count = var.env == "dev" ? 1 : 0
  provisioner "file" {
    source      = "user-data.sh"
    destination = "/tem/user-data.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\kphan\\Downloads\\Gitrepo\\Affine\\phani-aws.pem")
      host        = element(aws_instance.webapp.*.public_ip, count.index)
    }

  }
}