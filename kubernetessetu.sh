echo "[TASK 1]install git, in local"
sudo apt-get update --qq >/dev/null 2>&1
sudo apt-get install -y git >/dev/null 2>&1
sudo git clone https://github.com/devopsclouds/kubernetes.git
cd kubernetes

echo "[TASK 2]install kubectl command in local"
sudo apt-get update --qq >/dev/null 2>&1
sudo apt-get install -y apt-transport-https ca-certificates curl -qq >/dev/null 2>&1
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg >/dev/null 2>&1
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list>/dev/null 2>&1
sudo apt-get update --qq >/dev/null 2>&1
sudo apt-get install -y kubelet kubeadm kubectl --qq >/dev/null 2>&1

echo "[TASK 3]install lxc  command in local"


sudo apt-get update && sudo apt-get install lxc -y --qq >/dev/null 2>&1



echo "[TASK 4] set up kubernetes cluster one master and two worker nodes in lxc container"

sudo ./kubelx provision
echo "[TASK 5] copy kube config to local server
sudo mkdir ~/.kube
sudo lxc file pull kmaster/etc/kubernetes/admin.conf ~/.kube/config 
sudo chown -R $(id -u):$(id -g) $HOME/.kube/

