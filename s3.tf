resource "aws_s3_bucket" "subbu_s3" {
  bucket = "subbu_s3"
}

resource "aws_s3_access_point" "subbu_s3" {
  bucket = aws_s3_bucket.subbu_s3.id
  name   = "subbu_s3"
}