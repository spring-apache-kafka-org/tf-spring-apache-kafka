# tf-spring-apache-kafka

# Generate keys on Windows and Linux
ssh-keygen -t ed25519 -C "id_ed25519_spring_apache_kafka_org" -f .ssh/id_ed25519_spring_apache_kafka_org
ssh-keygen -t ed25519 -C "id_ed25519_spring_apache_kafka_org" -f ~/.ssh/id_ed25519_spring_apache_kafka_org
ssh -T git@id_ed25519_spring_apache_kafka_org
ssh-keygen -t ed25519 -C "id_ed25519_en412267" -f .ssh/id_ed25519_en412267
ssh-keygen -t ed25519 -C "id_ed25519_en412267" -f ~/.ssh/id_ed25519_en412267
ssh -T git@id_ed25519_en412267
ssh-keygen -t rsa -b 4096 -C "ion.mamaliga@endava.com" -f ~/.ssh/id_rsa_en412267

# Add key to ssh agent on Windows and Linux 
ssh-add -l
ssh-add .ssh/id_ed25519_spring_apache_kafka_org
ssh-add ~/.ssh/id_ed25519_spring_apache_kafka_org
ssh-add .ssh/id_ed25519_en412267
ssh-add ~/.ssh/id_ed25519_en412267

# Helm using Terraform
terraform init
helm list -A
kubectl get pods -n argocd
kubectl get secrets -n argocd
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath={.data.password} | base64 -d
kubectl port-forward svc/argocd-server -n argocd 8080:80
argocd username: admin / password: MV1973QUV0yJIsdc

# Apply the ssh-secret fist
kubectl apply -f spring-apache-kafka/dev/ssh-secret-github.yaml
kubectl apply -f spring-apache-kafka/dev/spring-apache-kafka-app.yaml
kubectl apply -f spring-apache-kafka/local/ssh-secret-github.yaml
kubectl delete -f spring-apache-kafka/local/spring-apache-kafka-app.yaml

# Port forward
kubectl port-forward service/spring-apache-kafka-producer 30105:8105 -n spring-apache-kafka

# View secrets
kubectl get secrets ssh-secret-github -o yaml -n argocd

# Only if docker repository is private, create this secret registry for namespace "spring-apache-kafka" where run you apps
kubectl create secret docker-registry docker-config-json -n spring-apache-kafka \
--docker-server="https://index.docker.io/v1/" \
--docker-username=ionmamaligadev \
--docker-password=dckr_pat_T41wujYLYrpi36xDNNtGiFQdMsk \
--docker-email=ionmamaligadev@gmail.com

argocd repo add https://github.com/ionmamaligadev/k8s-spring-apache-kafka.git --ssh-private-key-path C:\Users\imamaliga\.ssh\id_ed25519_spring_apache_kafka_org