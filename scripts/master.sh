set -x

if [[ $(hostname -I | cut -f2 -d' ') = 192.168.56.11 ]]; then 
#Pre-pull control plane images
kubeadm config images pull --kubernetes-version=$KUBE_VERSION
#Download calico config
kubeadm init --apiserver-advertise-address=192.168.56.11  --apiserver-cert-extra-sans=192.168.56.11 --pod-network-cidr 172.16.0.0/12 --kubernetes-version=$KUBE_VERSION
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml


mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

###export commnad
kubeadm token create --print-join-command > /vagrant/token-join
cp -i /etc/kubernetes/admin.conf $HOME/admin.conf

# install helm3
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

else
###export commnad
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

fi
set +x