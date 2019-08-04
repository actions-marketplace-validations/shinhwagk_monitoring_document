workflow "monitoring_cron" {
  on = "schedule(*/1 * * * *)"
  resolves = ["GitHub Action for Slack"]
}

action "remote-bash" {
  uses = "shinhwagk/remote-bash@master"
  env = {
    REMOTE_BASH_URL = "https://raw.githubusercontent.com/shinhwagk/monitoring_document/master/monitoring.sh"
  }
  args = "kubernetes website 31 content/en"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@e53b10281b03b02b016e1c7e6355200ee4d93d6d"
  needs = ["remote-bash"]
}
