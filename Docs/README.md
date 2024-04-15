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

- create a kind cluster:
```bash
kind create cluster --config kind-config.yaml
```

- added a new resource to the generated.tf.json file to create [MetalLB](https://kind.sigs.k8s.io/docs/user/loadbalancer/)  

-  Install Core Components: 
```bash
terraform -chdir=build/prod/terraform init && terraform -chdir=build/prod/terraform apply
``` 

- apply [Metallb](https://kind.sigs.k8s.io/docs/user/loadbalancer/) config file:

```bash
kubectl apply -f metallb-config.yaml
```

-  modify rabbitmqcluster in the spec section decreases the replicas from 2 to 1 and adds secretBackend section to define how RabbitMQ will access its secrets

- defines a Kubernetes Secret resource to store sensitive information for the RabbitMQ cluster, such as usernames, passwords, and connection details. 

- modify metadata in the deployment resource to specify a namespace, and added new args to Specifies:  
a) the name of the queue to use for the performance test.  
b) the rate at which messages are sent to the queue.  
c) the number of producer threads.  
d) the number of consumer threads.  
e) the rate at which messages are consumed from the queue.    
added secret key reference to the environment variable.   
modify resources argument to decrease the resource requirements for the RabbitMQ pods.    



- modify rabbittest scaledobject to add apiVersion and kind, add a new metadata section to specify the name and namespace of the deployment, and modify replicationcount to increase the number of replicas.

- specify the namespace of the deployment in the metadata section of the serviceaccount.

- defines a TriggerAuthentication resource o authenticate connections

- Apply Manifests:
```bash
kubectl apply -f ./build/prod/kubernetes
```


