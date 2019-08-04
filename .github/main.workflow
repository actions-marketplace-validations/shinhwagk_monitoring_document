workflow "monitoring_cron" {
  on = "schedule(*/1 * * * *)"
  resolves = ["GitHub Action for Slack"]
}

action "remote-bash" {
  uses = "srt32/git-actions@v0.0.3"
  args = "l"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@e53b10281b03b02b016e1c7e6355200ee4d93d6d"
  needs = ["remote-bash"]
}
