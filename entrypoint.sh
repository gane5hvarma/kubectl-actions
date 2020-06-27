#!/bin/sh 

echo "${KUBE_CONFIG_DATA}" | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig
result="$(kubectl $1)"
status=$? # get previous command output
echo "::set-output name=result::$result"
echo "$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi