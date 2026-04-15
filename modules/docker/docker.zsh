# Docker & Kubernetes Tools
alias lzd='lazydocker'
alias k='kubecolor'
alias kubectl='kubecolor'
alias k9s='k9s'

# Colima Management (Balanced settings: 2 CPUs, 2GB RAM, 20GB Disk)
alias docker-up='colima start --cpu 2 --memory 2 --disk 20'
alias k8s-up='colima start --profile k8s --cpu 2 --memory 4 --disk 20 --kubernetes'
alias docker-down='colima stop'
alias docker-status='colima status'

# Docker Host (Default to 'default' profile)
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

# Function to switch contexts
function docker-switch-k8s() {
  export DOCKER_HOST="unix://${HOME}/.colima/k8s/docker.sock"
  echo "Switched to K8s Docker Host"
}

function docker-switch-default() {
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  echo "Switched to Default Docker Host"
}
