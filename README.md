
**Automated Container Deployment and Administration in the Cloud
with CI/CD Pipeline**

Overview
Infrastructure Provisioning: Using Terraform to create and manage two AWS EC2 instances:

Control Node: Amazon Linux with Ansible.
 Host Node: Ubuntu with Docker.
Configuration Management: Ansible configures the host node to install and enable Docker.
Application Deployment: A Flask app is containerized with Docker and deployed via GitHub Actions.

Steps to Recreate the Project

1. Prerequisites: AWS CLI, Terraform, GitHub repository, Docker Hub account, Ansible, YAML knowledge.
2. Provision Infrastructure with Terraform: 
   - Create EC2 instances for control and host nodes.
   - Configure security groups.
   - Initialize and apply Terraform scripts.
3. Configure Control Node:
   - SSH into the control node.
   - Set up SSH access to the host node.
4. Configure Host Node with Ansible:
   - Write and run an Ansible playbook to install Docker.
5. Prepare GitHub Repository: 
   - Add Flask app code and Docker file.
   - Push the repository to GitHub.
6. Set Up Docker Hub: Create a repository and generate credentials.
7. Setup GitHub Actions:
   - Create a workflow file for build and deployment.
   - Add necessary secrets to GitHub.
8. Verify Deployment: Access the Flask app via public IP.
9. Clean Up Resources: Use Terraform to destroy resources.

Conclusion:
The project automates the end-to-end process of deploying a Flask app on AWS EC2 instances using modern DevOps tools. Docker Hub serves as the central image repository, and GitHub Actions streamline the CI/CD workflow.

