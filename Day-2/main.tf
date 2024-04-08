#multi region
provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-west-1"
  region = "us-west-1"
}

resource "aws_instance" "east-ec2" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  provider = aws.us-east-1
  #provide alias here after aws.us-east-1
  tags = {
    Name="web-apps-east"
  }
}

resource "aws_instance" "west-ec2" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  provider = aws.us-west-1
  tags = {
    Name="web-apps-west"
  }
}