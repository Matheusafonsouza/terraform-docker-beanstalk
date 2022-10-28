module "production" {
  source = "./"

  application_name = "docker_beanstalk"
  repository_name = "docker_beanstalk-prd"
  application_description = "Docker beanstalk application production"
  machine = "t2.micro"
  max = 5
}