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
sens@sens-k8s:~$ k get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
grafana      NodePort    10.96.21.134    <none>        80:31205/TCP   39h
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        43h
mysql        ClusterIP   None            <none>        3306/TCP       99m
prometheus   NodePort    10.109.180.17   <none>        80:30194/TCP   39h
webapp-sql   NodePort    10.102.35.239   <none>        80:32103/TCP   99m
```
