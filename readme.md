# Kube intro

## deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
   name: kube-intro
   namespace: default
spec:
   replicas: 1
   selector:
      matchLabels:
         kube-intro: web
   template:
      metadata:
         labels:
            kube-intro: web
      spec:
         containers:
            - name: kube-intro
              image: k8intro
              imagePullPolicy: Never

---
apiVersion: v1
kind: Service
metadata:
   name: k8intro-entrypoint
   namespace: default
spec:
   type: NodePort
   selector:
      kube-intro: web
   ports:
      - port: 8090
        targetPort: 8090
        nodePort: 30001
```
## talk notes
Apply deployment `k apply -f deployment.yaml`


get deployments  
`k get deployments`


get replica sets  
`k get rs`


get pods  
`k get pods`


### Debugging
make typo in docker image -> add something stupid mistake in deployment file


delete deployment  
`k delete deployment k8intro`


deploy again  
`k apply -f deployment.yaml`


debug via describe  
`k describe deployments`
`k describe rs`
`k describe pods`


fix pod  
`redeploy again`


describe on pod -> take IP -> show output