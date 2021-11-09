# install git & copy repository
# $ sudo yum install -y git
# $ git clone https://github.com/muratdemiray/AppFix.git

# update OS
sudo yum update -y

# install docker
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
docker info

# install kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version
