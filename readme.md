## Kube intro

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