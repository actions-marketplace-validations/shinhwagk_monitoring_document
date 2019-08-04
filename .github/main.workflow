workflow "monitoring_cron" {
  on = "push"
  resolves = ["monitoring"]

  #   on = "schedule(*/1 * * * *)"
}

action "monitoring" {
  uses = "./monitoring"
  #   args = "\"Hello world, I'm $MY_NAME!\""
  #   uses = "actions/bin/sh@master"
  #   args = ["aaaaa"]
  args = "kubernetes website 90 content/en"
  secrets = ["incoming_webhooks"]
  env = {
    offset_hour = "1"
    owner = "kubernetes"
    prefix = "content/en"
    repo = "website"

    #   on = "schedule(*/1 * * * *)"
  }

  #   on = "schedule(*/1 * * * *)"

  #   on = "schedule(*/1 * * * *)"

  #   on = "schedule(*/1 * * * *)"
}
