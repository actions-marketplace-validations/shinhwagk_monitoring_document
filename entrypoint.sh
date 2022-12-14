#!/bin/sh -l

repo_url=https://github.com/${owner}/${repo} && echo "monitoring repo: $repo_url"
git clone ${repo_url} && cd ${repo}

git config --global log.date local

offset_date=$(date -d "${offset_hours} hours ago" "+%Y-%m-%d %H:%M")
prefix=${prefix}

echo "#################################################"
git log --since="${offset_date}" --pretty=format:"%h" | while read commit_id
do
  git diff-tree --no-commit-id --name-only -r $commit_id | while read file
  do 
    if [[ "$(expr match $file $prefix)" != "0" ]]; then
      curl -X POST -H 'Content-type: application/json' \
      --data "{\"text\":\"${repo_url}/blob/master/$file\"}" $incoming_webhooks
      echo "${repo_url}/$file"
    fi
  done
done
echo "#################################################"
