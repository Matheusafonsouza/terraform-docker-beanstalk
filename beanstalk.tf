resource "aws_elastic_beanstalk_application" "application" {
  name        = var.application_name
  description = var.application_description
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.0 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = var.machine
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = var.maxSize
  }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}
