#!/usr/bin/bash
sudo apt-get update -y

# Installation of Brew and Kubernetes tools 

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc 

echo "✅ brew installed successfully"

echo " "

brew install derailed/k9s/k9s

sudo apt-get install fzf -y

echo "✅ kubectx, kubens, fzf, homebrew, and k9s installed successfully"

echo " "

# Start k3d cluster with three nodes
echo "✅ Intialize the Kuberentes cluster"

echo " "

k3d cluster create Dragon --servers 2

# Adding Nodes to the cluster 

echo "✅ Adding Nodes to the Kuberentes cluster"

echo " "

k3d node create Goku --cluster Dragon

k3d node create Beast --cluster Dragon

# Adding the config File

echo "✅ Adding the config files of kubernetes"

echo " "

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Show the kubectl nodes 

echo "✅ Showing the kubernetes nodes"

echo " "

kubectl get nodes 

alias k="kubectl"
alias kga="kubectl get all"
alias kgn="kubectl get all --all-namespaces"
alias kdel="kubectl delete"
alias kd="kubectl describe"
alias kg="kubectl get"

echo 'alias k="kubectl"' >> /home/$USER/.bashrc
echo 'alias kga="kubectl get all"' >> /home/$USER/.bashrc
echo 'alias kgn="kubectl get all --all-namespaces"' >> /home/$USER/.bashrc
echo 'alias kdel="kubectl delete"' >> /home/$USER/.bashrc
echo 'alias kd="kubectl describe"' >> /home/$USER/.bashrc
echo 'alias kg="kubectl get"' >> /home/$USER/.bashrc

echo "✅ The following aliases were added:"
echo " "
echo "alias k=kubectl"
echo "alias kga=kubectl get all"
echo "alias kgn=kubectl get all --all-namespaces"
echo "alias kdel=kubectl delete"
echo "alias kd=kubectl describe"
echo "alias kg=kubectl get"

source ~/.bashrc 
