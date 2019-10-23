provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = "${var.vpc_id}"

  # SSH access from the VPC
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "sg_80" {
  name = "sg_80"
  vpc_id = "${var.vpc_id}"

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_instance" "instance" {
  count         = "${var.instance_count}"
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
	tags = {
    Name  = "WEBSERVER-${count.index + 1}"
      }

  subnet_id = "${var.subnet_public_id}"
  vpc_security_group_ids=["${aws_security_group.sg_22.id}"]
  key_name = "${var.key_pair_name}"
}

