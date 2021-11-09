# install git & copy repository - RUN MANUALLY
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

# install terraform 1.0
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
sudo unzip terraform_1.0.0_linux_amd64.zip
sudo mv terraform /usr/bin/
terraform -v

# install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh  # -v v3.0.0  (for a specific version)
helm version

# !!! Configure AWS - IMPORTANT !!!
aws configure # be sure to login!!!
# AWS Access Key ID [None]: XXX
# AWS Secret Access Key [None]: XXX
# Default region name [None]: us-east-2
# Default output format [None]: json

# Build Docker image and push to the repo
    # If you build a new image, don't forget to change
    # imagename variable in the "/helm-app/values.yaml" 
# $ sudo docker build -t  testapp AppFix/docker/
# $ sudo docker login # be sure to login!
# username: XXXX
# password: XXXX 
# $ sudo docker push your-repo/app:latest

# Installing aws-iam-authenticator for EKS
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
openssl sha1 -sha256 aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
aws-iam-authenticator help

# Create EKS(k8s) Cluster
cd ./AppFix/terraform
terraform init
terraform apply -auto-approve
export KUBECONFIG=$KUBECONFIG:./kubeconfig_AppFix-cluster 
cd ../

# Deploy app & mysql
helm install --set db.username=testuser,db.password=usertest flaskapp helm-app/
helm install --set db.username=testuser,db.password=usertest mysql helm-mysql/
