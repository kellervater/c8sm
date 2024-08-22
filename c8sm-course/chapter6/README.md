# Minikube
Since `devcontainers` don't work well with `kind`, we decided to used the officially maintained `minikube` container feature.

This also eases the setup a bit.

So everytime you encounter a `kind` step in [chapter 6](https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719) of the C8SM course, you can refer to a respective script in this folder.

## Functions
* Create - With the `start-minikube.sh` you can (re)create/update a minikube cluster
* Stop - The script `stop-minikube.sh` stops the minikube cluster but retains all settings and images
* Delete - The script `delete-minikube.sh` removes any trace of the cluster from your system (the devcontainer)