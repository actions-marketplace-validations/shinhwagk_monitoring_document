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
  env = {
    incoming_webhooks = "https://hooks.slack.com/services/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"
  }

  #   on = "schedule(*/1 * * * *)"
}
