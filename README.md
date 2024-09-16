# AWS EKS Cluster with ALB Ingress Controller

## Overview

This project focuses on provisioning essential AWS components using **Terraform**. It includes the setup of an **Amazon EKS cluster**, **VPC**, **EKS node groups**, and the deployment of an **Application Load Balancer (ALB) Ingress Controller**. The objective is to create a scalable Kubernetes environment on AWS, automating infrastructure deployment with Infrastructure as Code (IaC).

## Infrastructure Setup

### 1. VPC and Networking
- A custom **VPC** was created to provide networking for the EKS cluster. 

### 2. EKS Cluster and Node Group
- The project provisions an **Amazon EKS cluster** to run Kubernetes workloads.
- **EKS Node Groups** were created within the cluster to provide scalable compute capacity, enabling the cluster to adjust resources based on demand.

### 3. ALB Ingress Controller
- The **ALB Ingress Controller** was deployed to manage the routing of external HTTP/HTTPS traffic to services running on the EKS cluster.
- The controller integrates with AWS services and manages the creation and configuration of the Application Load Balancer automatically.

## Technology Choices

### Terraform
- **Terraform** was chosen as the Infrastructure as Code (IaC) tool for this project due to its ability to manage AWS resources declaratively. Terraform modules were used to simplify the configuration and reuse of components.
  
### VPC Design
- A **custom VPC** was designed with public subnets to host both the load balancer and the EKS nodes.

### EKS and Node Groups
- **EKS Managed Node Groups** provide flexible compute resources for the Kubernetes cluster, enabling scaling of nodes as needed.

### ALB Ingress Controller
- The **ALB Ingress Controller** was chosen for its deep integration with AWS, allowing dynamic load balancing of external traffic based on Kubernetes Ingress resources.

## Challenges

1. **VPC and Subnet Configuration**: Ensuring that the public subnets were correctly configured to allow the Application Load Balancer to route traffic to the EKS nodes.
2. **ALB Ingress Controller Setup**: Ensuring that the controller had the correct IAM role and permissions to interact with AWS resources was a key step to automate load balancer management.
3. **Terraform State Management**: Managing the Terraform state to ensure consistent infrastructure updates and deployments was critical to avoid configuration drift.

## Conclusion

This project successfully automates the provisioning of key AWS components for a Kubernetes-based infrastructure. Using **Terraform**, the creation of the **VPC**, **EKS cluster**, **node groups**, and **ALB Ingress Controller** is fully automated, providing a scalable environment for Kubernetes workloads on AWS.
