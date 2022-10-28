helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
 helm repo update
 
 helm install myrelease ingress-nginx/ingress-nginx
