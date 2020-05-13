# Udacity DevOps Nano-Degree Capstone

## 1. Update system
    sudo apt update && sudo apt upgrade -y &&\
    sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget unzip &&\
    sudo apt install -y software-properties-common

## 2. install Python3.8
  These commands installs (python - python3 - pip - pip3 - java jdk - java jre)
  
    sudo apt install -y default-jre &&\
    sudo apt install -y default-jdk &&\
    sudo apt install -y python3 &&\
    sudo apt install -y python &&\
    sudo apt install -y python-pip &&\
    sudo apt install -y python3-pip &&\
    sudo apt update && sudo apt upgrade -y
    export PATH=~/.local/bin:$PATH
    source ~/.bashrc
    
  Check installed software version
    
    java --version
    python --version
    python3 --version
    pip --version
    pip3 --version
  
# Change to root user
    > sudo su

# 5. AWS CLI
    pip install awscli
    aws --version --client
    aws configure
	
	
# 6. Github URL 
	https://github.com/redaZayed/capsonDev
	

# Kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version --client
    
# Rout53
    redazayed-capstone.com
    
# Create bucket
    aws s3 mb s3://reda.zayed.udacity.capstone
    
# Configure environment variables.
  Open .bashrc file
    
    > sudo vi ~/.bashrc
    
  Add following content into .bashrc
  
    > export KOPS_CLUSTER_NAME=redazayed-capstone.com
      export KOPS_STATE_STORE=s3://reda.zayed.udacity.capstone
      export KOPS_DNS_ZONE=redazayed-capstone.com
  
  Then running command to reflect variables added to .bashrc
  
    > source ~/.bashrc

# SSH
    > ssh-keygen

# Create Kubernetes cluster definition.
    This step is creating the definition of cluster

        kops create cluster \
        --state=${KOPS_STATE_STORE} \
        --name=${KOPS_CLUSTER_NAME} \
        --node-count=2 \
        --master-size=t2.micro \
        --node-size=t2.micro \
        --zones=us-west-2a \
        --dns-zone=${KOPS_DNS_ZONE} \
        --dns private \
        --master-count 1

# Handshake K8s-Server.
  Handshake our K8s-server with the new created cluster using ssh.
    
    > kops create secret --name redazayed-capstone.com sshpublickey admin -i ~/.ssh/id_rsa.pub

# Apply cluster node changes
    This step create and deploy the cluster pods.

        > kops update cluster --state=${KOPS_STATE_STORE} --name=${KOPS_CLUSTER_NAME} --yes

 # Cluster info
    
    * validate cluster: kops validate cluster --name=capstone.k8s.redazayed.com --state s3://reda.zayed.udacity.capstone
    * list nodes: kubectl get nodes --show-labels
    * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.capstone.k8s.redazayed.com
    
# Delete cluster
    
    > kops delete cluster --name=${KOPS_CLUSTER_NAME} --yes --state=${KOPS_STATE_STORE}