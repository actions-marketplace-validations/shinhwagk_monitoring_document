workflow "monitoring_cron" {
  on = "schedule(0 */1 * * *)"
  resolves = ["remote-bash"]
}

action "remote-bash" {
  uses = "shinhwagk/remote-bash@master"
  env = {
    REMOTE_BASH_URL = "https://raw.githubusercontent.com/shinhwagk/monitoring_document/master/monitoring.sh"
  }
  args = "kubernetes website 1 prefix"
}
