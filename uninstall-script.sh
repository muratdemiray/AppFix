# Uninstalls only helm charts & destroys EKS Cluster
helm uninstall flaskapp 
helm uninstall mysql

cd AppFix/terraform
terraform destroy -auto-approve