# AWS Configuration #
# Step 1: Install AWS CLI
    https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# Step 2: Open a Terminal or Command Prompt

# In the terminal, run the following command:
aws configure

# Enter AWS Access Key ID
# Enter the AWS Access Key ID associated with your IAM user.
AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID

# Enter the AWS Secret Access Key
# Enter the AWS Secret Access Key associated with your IAM user.
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY

# Set Default Region
# Enter the default region you want to use.
Default region name [None]: us-central-1

# Set Output Format
# Choose the default output format.
Default output format [None]: json

# To ensure that your AWS CLI configuration is set up correctly, you can run a simple command to check your credentials:
aws sts get-caller-identity
# Update Kubernetes
aws eks update-kubeconfig --region us-east-1 --name dev-apache-kafka
aws eks describe-cluster --name dev-apache-kafka --query "cluster.status"
aws ec2 describe-nat-gateways --region us-east-1

# Update addon_version = "" in 12-pod-identity-addon.yaml
aws eks describe-addon-versions --region us-east-1 --addon-name eks-pod-identity-agent

# K8S
kubectl get nodes
kubectl auth can-i "*" "*"
kubectl get pods -n argocd
kubectl -n argocd exec -it updater-argocd-image-updater-5f9d7dff97-9czdb -- sh

kubectl config get-contexts
kubectl config use-context rancher-desktop
kubectl config use-context arn:aws:eks:us-east-1:385801411305:cluster/dev-apache-kafka

# Docker AWS
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 385801411305.dkr.ecr.us-east-1.amazonaws.com

docker tag ionmamaligadev/spring-apache-kafka-consumer:0.0.0 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-consumer:0.0.0
docker push 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-consumer:0.0.0

docker tag ionmamaligadev/spring-apache-kafka-producer:0.0.0 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-producer:0.0.0
docker push 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-producer:0.0.0

docker tag ionmamaligadev/spring-apache-kafka-consumer:0.0.0 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-consumer:0.0.0
docker tag ionmamaligadev/spring-apache-kafka-producer:0.0.0 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-producer:0.0.0

docker push 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-producer:0.0.0
docker push 385801411305.dkr.ecr.us-east-1.amazonaws.com/spring-apache-kafka-consumer:0.0.0