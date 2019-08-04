#!/bin/sh -l

# git clone https://github.com/$1/$2

# cd $2

# git config --global log.date local

# offset_date=`date -d "${3} hours ago" "+%Y-%m-%d %H:%M")`
# prefix=$4

# git log --since="${offset_date}" --pretty=format:"%h" | while read commit_id
# do
#   git diff-tree --no-commit-id --name-only -r $commit_id | while read file
#   do 
#     r=$(expr match $file $prefix)
#     if [[ $r != 0 ]]; then
#       echo $file
#     fi
#   done
# done

# ./monitoring.sh $@
ls -l ./
