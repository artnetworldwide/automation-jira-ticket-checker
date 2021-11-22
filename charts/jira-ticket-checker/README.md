# How to deploy this helm chart locally (to test it)

These instructions assume you have run the docker build instructions earlier and you have docker image locally built called `jira-ticket-checker:local`. Follow the docker build instructions in the [main README.md](../../README.md).

## Local Install

Tested with Docker Desktop Kubernetes.

Note: You can modify the local values in `local-values.yaml` as needed; these will not affect the real deployment.

```bash
# Connect to the local K8
kubectl config use-context docker-desktop

# CD to the chart folder
cd charts/jira-ticket-checker

# Show the charts with all template values replaced
helm template -f local-values.yaml .

# Lint the charts
helm lint -f local-values.yaml --strict .

# Install
helm install -f local-values.yaml jira-ticket-checker .

# Check status
kubectl get all --selector=app=jira-ticket-checker

# Get pod name and echo it
POD_NAME=$(kubectl get pods --selector=app=jira-ticket-checker -o jsonpath="{.items[*].metadata.name}")
echo $POD_NAME

# Get logs for pod
kubectl logs $POD_NAME

# If there are any errors, run `kubectl describe` for more info
kubectl describe pod $POD_NAME

# Port forward to access the pod
kubectl port-forward svc/jira-ticket-checker 3000:3000
```

Now try to access the app at http://localhost:3000

## Local uninstall

```bash
helm uninstall jira-ticket-checker
```

## Configuration

Default values can be found in `values.yaml`.

Some additional default local values are in `local-values.yaml`.

### Helm Chart Variables

| Parameter        | Description                                                                                                                                                                                            | Default                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------ |
| name             | The name of the service and deployment in Kubernetes                                                                                                                                                   | jira-ticket-checker |
| image            | The docker image name to pull from the registry e.g. docker.pkg.github.com/jira-ticket-checker/jira-ticket-checker                                                               | jira-ticket-checker |
| imageTag         | The docker tag of the image to pull; if `nil` then it will use the Helm chart version                                                                                                                  | ""                             |
| imagePullSecrets | Any secrets that are required to pull the docker image from a private docker registry. [More information here](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/). | []                             |
| internalPort     | The port that the Docker container listens on                                                                                                                                                          | 3000                           |
| externalPort     | The [published port](https://docs.docker.com/config/containers/container-networking/#published-ports) of this service.                                                                                 | 3000                           |
| replicaCount     | The number of instances of the app. Increase for high load or for testing your application functions properly with multiple instances / load balancing                                                 | 1                              |
| nodeEnv          | NODE_ENV environment variable                                                                                                                                                                          | production                     |

All values can be overridden, for example the array `imagePullSecrets` and the string `image`:

```yaml
imagePullSecrets:
  - name: docker-registry-github
```

```yaml
image: docker.pkg.github.com/artnetworldwide/jira-ticket-checker/jira-ticket-checker
```
