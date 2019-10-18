#!/usr/bin/env bash
#创建并查看RC
kubectl create -f mysql-rc.yaml
kubectl get rc
kubectl get pods
#mysql的定义文件
kubectl create -f mysql-svc.yaml
kubectl get svc
删除pod
kubectl delete pods mysql-kmq13 --grace-period=0 --force