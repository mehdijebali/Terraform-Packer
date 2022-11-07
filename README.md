# Provision Custom Instance with Terraform & Packer
In this demo, we will launch an EC2 Instance with Terraform from an AMI image (contains docker and nginx) created by Packer. We will use a VPC terraform module in order to setup a specific virtual network regarding the following diagram:
![](./Lab_Results/Packer.png)
## About Packer
Packer is as an open source tool for creating identical machine images for multiple platforms from a single source configuration. Which allows to launch completely provisioned and configured machines in seconds. 

The machines image contains a preconfigured operating system and installed software which is used to quickly create new running machines. This will speed up the boot time of Machine.

Packer builds an image by using a template file that contains two main blocks
#### Builders
Builders are responsible for creating machines and generating images from them for various platforms. There are separate builders for each Cloud Provider, each with its own configuration.
#### Provisioners
Provisioners are used to install and configure the machine image after booting. they prepare the system for use through for example installing the necessary packages.
#### Instructions
1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-Packer.git
```
2. Change the directory to **custom_ami_deployment** and create an SSH key and name it **levelup_key**
```
cd custom_ami_deployment && ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. Validate Packer configuration file syntax
```
packer validate install_custom_ami.json
```
5. Once the validation is succeeded, you can build the custom image
```
packer build install_custom_ami.json
```
6. Initiate Terraform in order to install the declared provider in `provider.tf` file after the Packer image build completion
```
terraform init
```
7. If you want to see your provisionning details, run the following command
```
terraform plan
```
8. Apply modifications
```
terraform apply
```
9. After the creation is completed, SSH to the EC2 instance
```
ssh ec2-user@<public_ip>
```
10. Check nginx installation
```
apt-get list --installed | grep nginx
```
11. Check docker installation
```
apt-get list --installed | grep docker
```
## Expected Results
After the provisionning is done, we can verify the implementation of EC2 instance, AMI image, and check the packer configuration.
#### EC2 Instance
![](./Lab_Results/instance.png)
#### AMI Image
![](./Lab_Results/packer_image.png)
#### Congiguration check 
When performing step 10 and 11, we should find similar results as the following
1. Docker
![](./Lab_Results/docker_verification.png)
2. Nginx
![](./Lab_Results/nginx_verification.png)
