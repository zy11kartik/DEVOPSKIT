# DevOps Tools Docker Image

This Docker image provides a comprehensive set of DevOps tools pre-installed on an Ubuntu base image. It includes Jenkins, Docker Engine, Java, Terraform, Ansible, Python, and kubectl for managing Kubernetes clusters.

## Tools Included

The following tools are installed in this Docker image:

1. **Jenkins** - Automation server for CI/CD pipelines
2. **Docker Engine** - To run containers within the Docker container itself
3. **Java (OpenJDK 11)** - Required for running Jenkins
4. **Terraform** - Infrastructure as Code (IaC) tool to provision and manage cloud infrastructure
5. **Ansible** - IT automation tool for configuration management and deployment
6. **Python3** - Programming language for automation scripts and other utilities
7. **kubectl** - Command-line utility to interact with Kubernetes clusters

## Prerequisites

To use this Docker image, you need to have the following installed on your system:

- **Docker**: Ensure Docker is installed and running on your system. You can check this with:

    ```bash
    docker --version
    ```

    If Docker is not installed, follow the official [Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.

## Installation

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/devops-tools-docker.git
cd devops-tools-docker
Step 2: Build the Docker Image
To build the Docker image from the Dockerfile, run the following command:

bash
Copy code
docker build -t devops-tools:latest .
This will download the necessary packages and tools, and create the Docker image.

Step 3: Run the Docker Container
After building the image, you can run the Docker container using the command below:

bash
Copy code
docker run -d -p 8080:8080 --privileged --name devops-container devops-tools:latest
Port 8080: Jenkins will be available on port 8080. Access Jenkins by visiting http://localhost:8080 in your web browser.
The --privileged flag allows Docker Engine to run inside the container.
Step 4: Access the Tools
Once the container is up and running, you can access the installed tools by opening a bash shell into the container:

bash
Copy code
docker exec -it devops-container /bin/bash

