const got = require('got');

const repo_name = process.env.repo_name || 'website'
const repo_owner = process.env.repo_owner || 'kubernetes'
const monitor_start_path = process.env.repo_path || 'content/en'


function fileListUrl(dirPath) {
  return `https://api.github.com/repos/${repo_owner}/${repo_name}/contents/${dirPath}`
}

function fileCommitDetail(filePath) {
  return `https://api.github.com/repos/${repo_owner}/${repo_name}/commits?path=${filePath}&per_page=1`
}

function getFiles(dirPath) {
  return got(fileListUrl(dirPath))
    .then(res => JSON.parse(res.body))
    .then(files => files.foreach(monitorFile))
}

async function monitorFile(file) {
  if (file.type === 'dir') {
    await getFiles(file.path)
    return
  }
  got(fileCommitDetail(file.path))
}