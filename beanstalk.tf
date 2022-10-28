resource "aws_elastic_beanstalk_application" "application" {
  name        = var.application_name
  description = var.application_description
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.10 running Docker"
}
