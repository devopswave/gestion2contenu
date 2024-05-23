resource "aws_s3_bucket" "bucket" {
  bucket = "my-cms-bucket"
  acl    = "private"

  tags = {
    Name = "MyCMSBucket"
  }
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}
