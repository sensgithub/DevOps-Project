# DXC Coding Marathon DevOps Project

This is a DevOps based project for a PHP/MySQL w/ Composer application.
<br>
<br>
Diagram showcasing the workflow:
<br>
<br>
![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/Untitled_Diagram.drawio2.jpg)

# Technologies

> ✦ Helm 3 <br>
> ✦ Docker <br>
> ✦ Kubernetes <br>
> ✦ ArgoCD <br>
> ✦ Terraform <br> 
> ✦ Monitoring with Prometheus/Grafana <br>
> ✦ Snyk for DevSecOps <br>
> ✦ GitHub Actions for CI/CD with Snyk <br>

# MySQL

```
kubectl cp ehospital.sql [sql_db_pod]:/tmp/ --server=https://192.168.49.2:8443 --insecure-skip-tls-verify

kubectl exec [sql_db_pod] -- mysql -u root -ppassword -e "SOURCE /tmp/ehospital.sql;"
```

# Kubernetes

Importing database dump to MySQL pod:
```
kubectl -n default exec -i [sql_db] -- mysql -u root -ppassword < /tmp/ehospital.sql
```
![alt text]([https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/argocd-test.png])
![alt text]([https://imgur.com/a/BhDOxCp])
# ArgoCD

ArgoCD is a declarative continuous delivery tool that automates deployment and updates to applications running in Kubernetes clusters. It provides a simple and easy-to-use interface for managing deployments, with features such as automated rollbacks and health monitoring.

Workflow:

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/argocd-test.png)

<p align="center">
  <img src="https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/argocd.gif" alt="argocd" />
</p>

<p align="center">
  <img src="https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/result.gif" alt="argocd" />
</p>

# Accessing the web app

Using the cluster's IP address and the given port from the webapp-sql service, we can access the web app:

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/ehospital.png)

![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/result-1.png)
