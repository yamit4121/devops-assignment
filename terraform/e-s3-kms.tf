resource "aws_s3_bucket" "devops-s3" {
  bucket = "devops-s3"
}

resource "aws_kms_key" "eks_encryption_key" {
  description             = "eks_encryption_key"
  deletion_window_in_days = 10
}
