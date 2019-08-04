workflow "monitoring_cron" {
  on = "push"
#   on = "schedule(*/1 * * * *)"
  resolves = ["GitHub Action for Slack"]
}

action "monitoring" {
  uses = "./monitoring"
#   args = "\"Hello world, I'm $MY_NAME!\""
#   uses = "actions/bin/sh@master"
#   args = ["aaaaa"]
  args = "kubernetes website 30 content/en"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@e53b10281b03b02b016e1c7e6355200ee4d93d6d"
  needs = ["monitoring"]
}
