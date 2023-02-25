# Ubuntu -> Vagrant -> K8s Playground
## Prerequisite
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

### Lets start
```bash
git clone https://gitlab.com/chavo1/vagrant-k8s.git
cd vagrant-k8s
```

#### Specify k8s version in Vagrantfile

```bash
KUBE_VERSION="1.26.1"
MASTER_COUNT=1
WORKER_COUNT=2
```

#### Check that Kubernetes is up and running

```bash
vagrant ssh master1
vagrant@master-1:~$ kubectl get nodes
NAME       STATUS     ROLES           AGE   VERSION
master-1   Ready      control-plane   38m   v1.26.1
worker-1   Ready      <none>          34m   v1.26.1
worker-2   Ready      <none>          28m   v1.26.1
```

#### Delete deployment

```bash
vagrant destroy -f
```
