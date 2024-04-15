## Stakpak Assessment 

## Description
we have a kubernetes cluster setup using [Kind](https://kind.sigs.k8s.io/) and have three core components:
- [Ingress Nginx](https://kubernetes.github.io/ingress-nginx/)
- [KEDA](https://keda.sh/)
- [RabbitMQOperator](https://www.rabbitmq.com/kubernetes/operator/operator-overview)

and we want to:

- Ensure all components are running and healthy
- Modify `rabbittest` deployment args to make it scale to maximum replicas
- Create an Ingress resource to expose rabbitmq management UI 

## Solution

- modify the kind-config file change role for the second node from control-plane to worker 

- create a kind cluster
 ```bash
  kind create cluster --config kind-config.yaml
  ```

- add resource to the generated.tf.json file to create MetalLB 

-  Install Core Components
```bash
terraform -chdir=build/prod/terraform init && terraform -chdir=build/prod/terraform apply
``` 

- modify rabbitmqcluster in spec section decrease the replicas from 2 to 1 , and add secretBackend 

- added a namespace to metadata to specify the name space 

