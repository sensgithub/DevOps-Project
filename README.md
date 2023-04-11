# DXC Coding Marathon DevOps Project

This is a DevOps based project for a PHP/MySQL w/ Composer application.
<br>
<br>
Diagram showcasing the workflow:
<br>
<br>
![alt text](https://github.com/sensgithub/DevOps-Project/blob/main/screenshots/diagram-new.png)

# Technologies

> ✦ Helm 3 <br>
> ✦ Docker <br>
> ✦ Kubernetes <br>
> ✦ Terraform <br>
> ✦ Monitoring with Prometheus/Grafana <br>
> ✦ Snyk for DevSecOps <br>
> ✦ GitHub Actions for CI/CD with Snyk <br>

Importing database dump to MySQL pod:
```
kubectl -n default exec -i [sql_db] -- mysql -u user -ppassword < ehospital.sql
```
