resource "aws_s3_bucket" "b" {
  bucket = "{{ bucket_name }}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "b_public_access_block" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "b_acl" {
  depends_on = [
    aws_s3_bucket_public_access_block.b_public_access_block,
  ]

  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
