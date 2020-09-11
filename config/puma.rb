threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
# port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

domain_name = ENV.fetch("DOMAIN_NAME") { "192.168.56.103" }
if domain_name != "192.168.56.103"
  app_root = File.expand_path("../..", __FILE__)
  bind "unix://#{app_root}/tmp/sockets/puma.sock"
  stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true
  pidfile "#{app_root}/tmp/pids/puma.pid"
else
  port        ENV.fetch("PORT") { 3000 }
end