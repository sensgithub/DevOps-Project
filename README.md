# DXC Coding Marathon DevOps Project

This is a DevOps based project for a PHP/MySQL w/ Composer application.
<br>
<br>
Diagram showcasing the workflow:
<br>
<br>
![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/diagram-new-argo.png)

# Technologies

> ✦ Helm 3 <br>
> ✦ Docker <br>
> ✦ Kubernetes <br>
> ✦ ArgoCD <br>
> ✦ Terraform <br> 
> ✦ Monitoring with Prometheus/Grafana <br>
> ✦ Snyk for DevSecOps <br>
> ✦ GitHub Actions for CI/CD with Snyk <br>

# Terraform
```
chmod 755 .terraform/providers/registry.terraform.io/hashicorp/kubernetes/2.19.0/linux_amd64/terraform-provider-kubernetes_v2.19.0_x5
```
Using the command above in case of permission error

# SQL

```
kubectl config use-context minikube --user=sens

kubectl cp ehospital.sql sqldb-696d7f78d7-4bhwq:/tmp/ --server=https://192.168.49.2:8443 --insecure-skip-tls-verify

kubectl exec sqldb-696d7f78d7-4bhwq -- mysql -u root -ppassword -e "USE ehospital; SOURCE /tmp/ehospital.sql;"
```

# K8s

Importing database dump to MySQL pod:
```
kubectl -n default exec -i [sql_db] -- mysql -u user -ppassword < ehospital.sql
```
Pods:
```
sens@sens-k8s:~$ kubectl get pods
NAME                          READY   STATUS    RESTARTS       AGE
grafana-6dd975c79d-8vvbd      1/1     Running   2 (100m ago)   39h
prometheus-78647c7dd8-47p8x   1/1     Running   1 (33h ago)    39h
sqldb-6f94948884-8xrzd        1/1     Running   0              99m
webapp1-5d9dcfbd6d-fvlzz      1/1     Running   0              99m

```
Services:
```
sens@sens-k8s:~$ kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
grafana      NodePort    10.96.21.134    <none>        80:31205/TCP   39h
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        43h
mysql        ClusterIP   None            <none>        3306/TCP       99m
prometheus   NodePort    10.109.180.17   <none>        80:30194/TCP   39h
webapp-sql   NodePort    10.102.35.239   <none>        80:32103/TCP   99m
```
Cluster IP:
```
sens@sens-k8s:~$ kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```
# ArgoCD

ArgoCD is a declarative continuous delivery tool that automates deployment and updates to applications running in Kubernetes clusters. It provides a simple and easy-to-use interface for managing deployments, with features such as automated rollbacks and health monitoring.

Workflow:

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/argocd-test.png)

<p align="center">
  <img src="https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/argocd.gif" alt="argocd" />
</p>

# Accessing the web app

Using the cluster's IP address and the given port from the webapp-sql service, we can access the web app:

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/ehospital.png)

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/result-1.png)
