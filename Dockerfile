# Base image
FROM ubuntu:20.04

# Set environment variables to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential packages
RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jdk \
    curl \
    git \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    gnupg2 \
    lsb-release \
    wget \
    python3 \
    python3-pip \
    unzip \
    sudo

# Add Jenkins key and repository
RUN wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null && \
    apt-get update && \
    apt-get install -y jenkins

# Install Docker Engine
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip && \
    unzip terraform_1.6.0_linux_amd64.zip && \
    mv terraform /usr/local/bin/

# Install Ansible
RUN apt-get update && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose Jenkins port
EXPOSE 8080

# Start Jenkins as default entrypoint
ENTRYPOINT ["jenkins"]

