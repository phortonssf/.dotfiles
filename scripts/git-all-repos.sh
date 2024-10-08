#!/bin/bash
#requires jq -> http://stedolan.github.io/jq/

#optional change working_dir
working_dir=${1-$(pwd)}
cd $working_dir

user="phortonssf
token=""
organization="galley-solutions"


repo_list=$(curl https://api.github.com/orgs/$organization/repos?type=private\&per_page=100 -u ${user}:${token}  | jq .[].ssh_url | sed -e 's/^"//'  -e 's/"$//')

for repo in $repo_list
do

  echo "Repo found: $repo"
  git clone $repo
done
