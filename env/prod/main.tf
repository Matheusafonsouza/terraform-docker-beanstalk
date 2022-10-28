module "production" {
  source = "../../"
  environment = "production"
  application_name = "docker-beanstalk"
  repository_name = "docker-beanstalk-production"
  application_description = "Docker beanstalk application production"
  machine = "t2.micro"
  maxSize = 5
}