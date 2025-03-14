alias kb="kubie"
alias kid="kubie info depth"
alias grbm="git checkout main && git fetch origin main && git rebase origin/main"

alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias kgp="kubectl get po"
alias kctx="kubectl config current-context"
alias krm="kubectl delete"
alias kgn='kubectl get nodes -ocustom-columns="NAME:.metadata.name,TYPE:.metadata.labels.type,CREATED_AT:.metadata.creationTimestamp,TAINTS:.spec.taints[*].key,VERSION:.status.nodeInfo.kubeletVersion" --sort-by .metadata.creationTimestamp'

alias kks="kb ns kube-system -r"

alias killbg="jobs -p | tr -d '+-'| tr -s ' ' | cut -d' ' -f2 | xargs -I{} kill -9 {}"

alias gmrg="gh pr merge -r -d"
alias gpc="gh pr create"
alias gweb="gh pr view -w"

