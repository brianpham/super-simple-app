# Super Simple App (SSA)

## Local Development

### Local Kubernetes Cluster
####  Create a local Kubernetes cluster using kind
```
$ kind create cluster --name super-simple-app --image kindest/node:v1.24.2 --config kind.yaml
```



### Building Image
docker build -t supersimpleapp:v1 .

### Running Image
docker run -ti -p 80:80 docker.io/library/supersimpleapp:v1

### Verifying
`curl http://localhost:80/index.html`
`curl http://localhost:80/page1.html`
`curl http://localhost:80/page2.html`

## CICD

Pushing to the main branch will automatically start a GitHub Action job, which will do the following.

- Check out the branch
- Build and push the container image
- Run terraform plan and apply




