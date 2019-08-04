#!/bin/sh

repo_url=https://github.com/$1/$2
git clone ${repo_url} && cd $2

git config --global log.date local

offset_date=$(date -d "${3} hours ago" "+%Y-%m-%d %H:%M")
prefix=$4

echo "#################################################"
git log --since="${offset_date}" --pretty=format:"%h" | while read commit_id
do
  git diff-tree --no-commit-id --name-only -r $commit_id | while read file
  do 
    if [[ "$(expr match $file $prefix)" != "0" ]]; then
      curl -X POST -H 'Content-type: application/json' \
      --data "{\"text\":\"${repo_url}/blob/master/$file\"}" $incoming_webhooks
    fi
  done
done
echo "#################################################"
