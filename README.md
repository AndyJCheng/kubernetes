## kubernetes  
kubernetes是谷歌公司开源的一个容器管理平台。就是将Borg项目最精华的部分提取出来，使现在  
的开发者能够更简单直接的去使用它。  

### kubernetes核心功能  
自我修复  
服务发现和负载均衡  
自动部署和回滚  
弹性伸缩  

### kubernetes应用场景  
微服务  

### kubernetes核心组件  
| 组件名称 |  说明 |
| --- | --- |
| etcd | 保存这个集群的状态 |  
| apiserver | 提供资源操作的唯一入口，提供授权，认证，访问控制，api注册和发现等机制 | 
| controller manager | 负责维护集群的状态，故障检测，自动扩展，滚动更新 |
| scheduler | 负责资源的调度，按照规定的调度策略将Pod调度到对应的机器上 |
| kubelet | 负责Pod对应的容器的 创建、启停等任务，与Master节点密切协作，实现集群管理的基本功能 |
| kube-proxy | 负责为Service提供cluster内部的服务发现和负载均衡 |
| Container Runtime| 负责镜像管理以及Pod和容器的真正运行 |

### k8s安装  
1 master  
yum install etcd -y  
systemctl restart etcd  
yum install kubernetes-master  
systemctl restart kube-apiserver.service  
systemctl restart kube-controller-manager.service  
systemctl restart kube-scheduler.service  
kubectl get componentstatus  
2 node  
yum install kubernetes-node -y  
systemctl start kubelet.service  
systemctl start kube-proxy.service  

kubectl delete node 127.0.0.1  
kubectl get nodes  

### flannel
yum install flannel -y  
创建网段，所有的docker容器都在这个网段  
vim /etc/sysconfig/flanneld  
etcdctl set /atomic.io/network/config '{ "Network": "172.16.0.0/16"}'  
systemctl restart flanneld  
systemctl restart docker  

### pod
k8s创建pod资源,控制至少两个容器,业务容器和Pod容器,业务容器使用的是pod容器(pause容器)的ip  
为什么k8s会有Pod这个概念  
1 通过Pod容器的根容器pause容器，以它的状态来代表整个容器组的状态  
2 多个业务容器共享pause容器的ip,共享pause容器挂载的volume,解决了文件共享  
3 kubernetes底层支持两个pod之间tcp/ip相互通信,通过采用虚拟二层网络实现,一个pod里面的容器可以另外主机上的pod容器通信   
kubectl create -f nginx.yaml
kubectl get pods
kubectl describe pod podname 
kubectl explain pod  
kubectl explain pod.spec.containers  
kubectl delete pod podname --force --grace-period=0  
kubectl apply -f nginx.yaml  

### Replication Controller
保证应用能够持续运行，确保任何时间Kubernetes中都有指定数量的pod在运行，在此基础上  
RC还提供了一些高级特性，比如滚动升级，升级回滚等.  
rc如何和pod关联? 通过label  
kubectl edit pod nginx  
#滚动升级  
kubectl rolling-update nginx -f nginx-rc2.ymal --update-period=30s  
#回滚  
kubectl rolling-update nginx2 -f nginx-rc.ymal --update-period=1s  
kubectl rolling-update nginx2 nginx --rollback --update-period=1s  
### service  
