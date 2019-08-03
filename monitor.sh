#!/usr/bin/env bash
git config --global log.date local

curr_date=$(date -d "$(date) 1 hours ago" "+%Y-%m-%d %H:%M")
prefix="content/en"

git log --since="${curr_date}" --pretty=format:"%h" | while read commit_id
do
  git diff-tree --no-commit-id --name-only -r $commit_id | while read file
  do 
    r=$(expr match $file $prefix)
    if [[ $r != 0 ]]; then
      echo $file
    fi
  done
done