Rainbows! do
  use :ThreadPool
  worker_processes 2
  worker_connections 32
  timeout 30
  stderr_path '/dev/null'
  stdout_path '/dev/null'
  listen 4000, backlog: 2048
end
