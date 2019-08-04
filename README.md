# monitoring kubernetes website change -> slack webhook
```sh
git log --since="2019-08-03 16:29:00" --pretty=format:"%h"
git diff-tree --no-commit-id --name-only -r
```
