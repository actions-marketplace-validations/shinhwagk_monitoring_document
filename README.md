# monitoring github repo content change

### example: kubernetes website change -> slack incoming_webhooks

```yml
name: Monitoring

on: 
  schedule:
    - cron:  '*/1 * * * *'

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: shinhwagk/monitoring_document@master
      env:
        owner: "kubernetes"
        repo: "website"
        offset_hours: 1
        prefix: "content/en"
        incoming_webhooks: ${{ secrets.incoming_webhooks }}

```

# env
- owner
- repo
- offset_hours
- prefix repo
- incoming_webhooks


### note
```sh
git log --since="2019-08-03 16:29:00" --pretty=format:"%h"
git diff-tree --no-commit-id --name-only -r
```