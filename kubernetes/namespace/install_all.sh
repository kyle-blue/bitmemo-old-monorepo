#!/bin/sh

echo "Have you created kubeadm node yet? (y/n)"
read CREATED

if [ "$CREATED" != "y" ]; then
    sudo kubeadm init --pod-network-cidr=192.168.0.0/16

    mkdir -p $HOME/.kube
    sudo echo yes | sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
fi

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

kubectl create namespace build
kubectl create namespace app
kubectl apply -Rf $SCRIPTPATH
kubectl taint nodes --all node-role.kubernetes.io/master- # This is for calico setup
kubectl apply -Rf $SCRIPTPATH # This is to get rid of creation order problems
kubectl create job initial-certificate-renewal -n app --from cronjob/certificate-renewal # Get initial certificate

