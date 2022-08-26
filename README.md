
# Super Simple App (SSA)

## Getting Started
The sections below demonstrate a quick and easy way to build a docker image that serves static files and deployed on a Kubernetes cluster.

### Building Container Image
1. Run the GitHub Actions [Build](https://github.com/brianpham/super-simple-app/actions/workflows/build.yaml)  workflow to build the image and grab the **tag** generated from the build. 
### Generating Terraform Configuration
*NOTE: For debugging purposes, you can start an up term session. Also dry-run only is turned on by default. * 

1. Run the GitHub Actions [Generate](https://github.com/brianpham/super-simple-app/actions/workflows/generate.yaml) workflow to update the Terraform configuration to use the new container image created above. Be sure to update the tag field and run workflow. Running the workflow with dry-run enabled will not create a **GitHub Pull Request**. 
2. Verify that the output of the Terraform configuration looks right and re-run the workflow if everything looks good. 

### Applying Changes Using Terraform
1. The above GitHub Actions workflow should have created a Pull Request based off the changes found. Verify that the PR looks good and merge into the main branch. Terraform will automatically kick off another GitHub Actions workflow to apply the changes to the cluster. 
  

## Local Development

  

### Local Kubernetes Cluster

#### Create a local Kubernetes cluster using kind

```

$ kind create cluster --name super-simple-app --image kindest/node:v1.24.2 --config kind.yaml

```

#### Building Container Image

TODO: Add instructions to build container image locally

#### Running Container Image

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: supersimpleapp
  labels:
    app: supersimpleapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: supersimpleapp
  template:
    metadata:
      labels:
        app: supersimpleapp
    spec:
      containers:
      - name: supersimpleapp
        image: 
        ports:
        - containerPort: 8787
```


### Verifying

`curl http://localhost:8787/index.html`