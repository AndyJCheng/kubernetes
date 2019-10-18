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

