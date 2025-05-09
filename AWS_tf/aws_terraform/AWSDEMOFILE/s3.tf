#resource "aws_s3_bucket" "Mybucket" {
#  bucket = var.bucket
#  #region = eu-central-1
#
#  tags = {
#    Name        = "Mybucket"
#    Environment = "Dev"
#  }
#  depends_on = [aws_instance.webapp]
#}