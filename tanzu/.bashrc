set -o vi
export PATH="~/bin:$PATH"

### kubernetes stuff
alias kk="kubectl"
alias kget="kubectl get"
alias kns="kubectl config set-context $(kubectl config current-context) --namespace"
eval "$(direnv hook bash)"
echo "#######################################"
