## install
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
```
## 系统内存不足，无法启动虚拟机 minikube，需要内存大小 2200 MB
```bash
minikube config set memory 4092
minikube config set cpus  3
```
