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
WORKER_COUNT=3
```

#### Check that Kubernetes is up and running

```bash
vagrant ssh master1
sudo -i
root@master-1:~# kubectl get nodes
NAME       STATUS   ROLES           AGE     VERSION
master-1   Ready    control-plane   12m     v1.26.1
worker-1   Ready    <none>          8m57s   v1.26.1
worker-2   Ready    <none>          5m54s   v1.26.1
worker-3   Ready    <none>          2m18s   v1.26.1
```

#### Check helm version
```bash
root@master-1:~# helm version
version.BuildInfo{Version:"v3.11.1", GitCommit:"293b50c65d4d56187cd4e2f390f0ada46b4c4737", GitTreeState:"clean", GoVersion:"go1.18.10"}
```

#### Delete deployment
```bash
vagrant destroy -f
```
