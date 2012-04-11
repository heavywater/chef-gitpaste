node[:gitpaste] = Mash.new
node[:gitpaste][:directory] = '/var/www/gitpaste'
node[:gitpaste][:red_unicorn] = nil
node[:gitpaste][:web_server] = :nginx
node[:gitpaste][:init_type] = :bluepill
node[:gitpaste][:gunicorn] = Mash.new(
  :workers => 4,
  :backlog => 4096,
  :listen => nil,
  :pid => nil,
  :exec => nil,
  :config => '/etc/gunicorn/gitpaste.app'
)
