
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
    key = "index.html"
    source = "index.html"
    acl = "public-read"
    bucket = aws_s3_bucket.my_bucket.id
    content_type = "text/html"
}

resource "aws_s3_object" "error" {
    key = "error.html"
    source = "error.html"
    acl = "public-read"
    bucket = aws_s3_bucket.my_bucket.id
    content_type = "text/html"
}

resource "aws_s3_object" "styles" {
    key = "styles.css"
    source = "styles.css"
    acl = "public-read"
    bucket = aws_s3_bucket.my_bucket.id
    content_type = "text/css"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}