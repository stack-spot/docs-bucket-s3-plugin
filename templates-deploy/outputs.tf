output "bucket-s3-conn-arn" {
  value = aws_s3_bucket.b.arn
}

output "bucket-s3-conn-bucket_name" {
  value = aws_s3_bucket.b.bucket
}
