resource "aws_s3_bucket" "b" {
  bucket = "{{ bucket_name }}"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "b_ownership_controls" {
  bucket = aws_s3_bucket.b.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "b_public_access_block" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "b_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.b_ownership_controls,
    aws_s3_bucket_public_access_block.b_public_access_block,
  ]

  bucket = aws_s3_bucket.b.id
  acl    = "public-read"
}
