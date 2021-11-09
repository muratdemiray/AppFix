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

# Configure AWS
aws configure
# AWS Access Key ID [None]: XXX
# AWS Secret Access Key [None]: XXX
# Default region name [None]: us-east-2
# Default output format [None]: json

# Build Docker image and push to the repo
sudo docker build -t  testapp AppFix/docker/
sudo docker login
# username
# password 
sudo docker push ironmoon1/app:latest

# Create EKS(k8s) Cluster
cd terraform
terraform apply -auto-approve
export KUBECONFIG=$KUBECONFIG:~/kubeconfig_AppFix-cluster 
cd ../

# Deploy app & mysql
helm install --set db.username=testuser,db.password=usertest flaskapp helm-app/
helm install --set db.username=testuser,db.password=usertest mysql helm-mysql/


