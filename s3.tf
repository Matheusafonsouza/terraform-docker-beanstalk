resource "aws_s3_bucket" "beanstalk_deploys" {
    bucket = "${var.repository_name}-deploys"
    force_destroy = true
}

resource "aws_s3_bucket_object" "beanstalk_docker" {
  depends_on = [
    aws_s3_bucket.beanstalk_deploys
  ]
  bucket = "${var.repository_name}-deploys"
  key = "${var.repository_name}.zip"
  source = "${var.repository_name}.zip"
  etag = filemd5("${var.repository_name}.zip")
}
