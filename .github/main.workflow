workflow "monitoring_cron" {
  on = "schedule(0 */1 * * *)"
  resolves = ["monitoring"]
}

action "monitoring" {
  uses = "./monitoring"
  args = "kubernetes website 90 content/en"
  secrets = ["incoming_webhooks"]
  env = {
    owner = "kubernetes"
    repo = "website"
    prefix = "content/en"
    offset_hours = "1"
  }
}
