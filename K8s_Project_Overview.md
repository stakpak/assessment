
# Project Overview

In this project, you set up a Kubernetes environment using Kind, deployed an Nginx Ingress Controller for managing external access, installed RabbitMQ for messaging, and configured KEDA for autoscaling. Helm was used to streamline the deployment of these components. The project involved:

1. **Setting up the Cluster**: Created a Kind cluster and configured networking.
2. **Deploying Nginx Ingress**: Installed the Nginx Ingress Controller to manage external traffic.
3. **RabbitMQ and KEDA**: Deployed RabbitMQ for messaging and KEDA for scaling workloads based on demand.
4. **Managing with Helm**: Used Helm charts to manage the deployments, making it easier to install, upgrade, and manage Kubernetes applications.

## Detailed Steps

### Cluster Setup:

- Installed Kind and created a local Kubernetes cluster.
- Configured kubectl to interact with the cluster.

### Nginx Ingress Installation:

- Added the ingress-nginx Helm repository.
- Installed the Nginx Ingress Controller using Helm, enabling external access to your services.

### RabbitMQ and KEDA Deployment:

- Added the Bitnami Helm repository.
- Deployed RabbitMQ using Helm, providing a reliable messaging system.
- Installed KEDA to enable event-driven autoscaling of your applications, ensuring they scale based on RabbitMQ message queue metrics.

### Configuration and Testing:

- Configured services and Ingress rules for your applications.
- Tested the setup by accessing the services through the Ingress Controller.

## Conclusion

This project provided hands-on experience in setting up and managing a scalable, event-driven architecture on Kubernetes, using modern tools like Kind, Helm, and KEDA. The setup is ideal for development and testing environments and offers a robust foundation for building cloud-native applications.
