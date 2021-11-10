# AppFix

This project aims to run an application in a container on a Kubernetes cluster for fixing.

##  Summary / Scenario
Developer team is working on a python Project. Because of environment differences, the codes that is shared by developer team is not working on production cluster.
To fix this problem you’ve decided to run that application in a container on a Kubernetes cluster.
To standardize development environment you’ve started to work on docker containers.

## Pre-requisites

- AWS account (user credentials: access-key-id,secret-access-key,region:us-east-2)
- AWS EC2 running

##  Requirements
- Docker Base Image for Python App: alpine:3.7
- Terraform version must be 1.0
- Helm 3
- While developing the project use Github, and keep a decent history so your approach to the project is visible.
- Python version must be 2.7.x
- Application code: https://github.com/muratdemiray/AppFix/blob/main/docker/application.py
- Required python packages:
  1. Flask
  2. MySQL-python
 
##  Deliverables
1. Github repo of the python application
2. A simple readme on how to use the tooling
3. Dockerfile for containerization
4. Terraform folder that contains terraform files at the root directory of the project (it should deploy a Kubernetes cluster)
5. Helm chart of application

##  Objectives
1. A single command should provision the Kubernetes Cluster on a cloud platform that you’ve choosed (Terraform infra provisioning)
2. Single Helm command to deploy application to Kubernetes
3. Single Helm command to deploy mysql

# Deploy & Run Project
1. Login/shh to your AWS EC2
2. Install git # sudo yum install -y git
3. Clone the github repo using # git clone https://github.com/muratdemiray/AppFix.git
4. Follow each steps in setup-script.sh (manual installation if you edit or want to debug) \
        or  \
   execute  # sh ./AppFix/setup-script.sh (<!>don't forget to enter aws credentials when it promts, region:us-east-2)
5. Wait for cluster creation and app delployment on cluster.
6. Check if K8s pods & service are running
    -  $ kubectl get pods
    -  $ kubectl get svc flask-web-svc
7. Check if app runs
    - grep external-ip output from step 6
    - open a web browser and visit [external-ip]:3000
    - <!> external-ip dns propogration may take some time, wait for a time if you can't access url adnd try again!

## Uninstall (only helm charts & destroys EKS Cluster)
-  execute  # sh ./AppFix/uninstall-script.sh \
   or uninstall manually runinng the commands below: 
-  $ helm uninstall flaskapp 
-  $ helm uninstall mysql
-  $ cd AppFix/terraform
-  $ terraform destroy -auto-approve

