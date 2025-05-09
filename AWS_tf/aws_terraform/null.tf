resource "null_resource" "cpfile" {
  count = var.env == "dev" ? 1 : 0
  provisioner "file" {
    source      = "user-data.sh"
    destination = "/tmp/user-data.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\kphan\\Downloads\\Gitrepo\\Affine\\phani-aws.pem")
      host        = element(aws_instance.webapp.*.public_ip, count.index)
    }

  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/user-data.sh",
      "sudo sh /tmp/user-data.sh",
      "sudo yum update -y",
      "sudo yum install jq unzip -y"

    ]
     connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\kphan\\Downloads\\Gitrepo\\Affine\\phani-aws.pem")
      host        = element(aws_instance.webapp.*.public_ip, count.index)
    }

    
  }
}