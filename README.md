# AppFix

This project aims to run an application in a container on a Kubernetes cluster for fixing.

## Pre-requisites

- AWS account
- AWS EC2 running

##  Summary / Scenerio
Developer team is working on a python Project. Because of environment differences, the codes that is shared by developer team is not working on production cluster.
To fix this problem you’ve decided to run that application in a container on a Kubernetes cluster.
To standardize development environment you’ve started to work on docker containers.

##  Summary / Scenerio
Docker Base Image for Python App: alpine:3.7
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
6. 
##  Objectives
1. A single command should provision the Kubernetes Cluster on a cloud platform that you’ve choosed (Terraform infra provisioning)
2. Single Helm command to deploy application to Kubernetes
3. Single Helm command to deploy mysql

# RUN & DEPLOY PROJECT
1. Login an AWS EC2
2. install git # sudo yum install -y git
3. clone the github repo using # https://github.com/muratdemiray/AppFix.git
