
data "amazon-ami" "ubuntu" {
  filters = {
    name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
  region      = "us-east-1"
}

source "amazon-ebs" "ui" {
  ami_name      = "ubuntu-pkr-${formatdate("YYYY-MM-DD-hhmmss", timestamp())}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "${data.amazon-ami.ubuntu.id}"
  ssh_username  = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ui"]

  provisioner "shell" {
    inline = ["sudo apt-get update -y"]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
  }

}
