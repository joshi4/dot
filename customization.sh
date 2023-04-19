ulimit -n 524288
ulimit -u 2048

topForNode() {
  k top po -A | rg $(X=$(for i in $(k get po --field-selector=spec.nodeName=$1 -A --no-headers | awk '{print $2}'); do printf "%s|" $i; done) && echo ${X%?})
}

alias kcountnodes='k get nodes --no-headers | cut -w -f3 | sort | uniq -c | sort -nr'

podLabels() {
  k get po $1 -o yaml | yq .metadata | yq .labels
}

pgPodByName(){
  k get po -lname=$1 -A -o wide
}

pods_regex_on_node_regex() {kubectl get nodes | rg "$2" | tr -s " " | cut -d' ' -f1 | xargs -I{} kubectl get pods --field-selector=spec.nodeName={} -A | rg "$1" | tr -s " "}

pods_on_node() {kubectl get pods --field-selector=spec.nodeName=$1 -A}

cronjob_on_node() {kubectl get pods -lserviceType=cron --field-selector=spec.nodeName=$1 -A -o custom-columns=:metadata.namespace,:metadata.name,:metadata.labels.cron-job-plan --no-headers}

top_for_node() { k top po -A | grep -f <(k get po --field-selector=spec.nodeName=$1 -o custom-columns=:metadata.namespace,:metadata.name --no-headers -A ); }

checkCert () {
	echo | openssl s_client -connect $1:443 2> /dev/null | openssl x509 -noout -subject -dates
}

review() {
  watch -n 600 gh pr list --search \"is:open is:pr review-requested:joshi4 archived:false\"
}

watchz () {
  watch -x zsh -c "source ~/.zshrc && $*"
}

pr_summary() { git log --oneline master..HEAD | cut -d' ' -f2- }

alias test_every_commit='git rebase -x bin/go-tests.sh origin/master'

export PATH=$PATH:/Users/shantanu/Library/Python/3.9/bin

# for kube cluster auth
# Use the new gcloud auth plugin, required for k8s 1.25+
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export RENDER_USE_PGCLI=true
