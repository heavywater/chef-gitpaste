default[:gitpaste] = Mash.new
default[:gitpaste][:directory] = '/var/www/gitpaste'
default[:gitpaste][:red_unicorn] = nil
default[:gitpaste][:web_server] = :nginx
default[:gitpaste][:init_type] = :bluepill
default[:gitpaste][:gunicorn] = Mash.new(
  :workers => 4,
  :backlog => 4096,
  :listen => nil,
  :pid => nil,
  :exec => nil,
  :config => '/etc/gunicorn/gitpaste.app'
)
default[:gitpaste][:superuser] = Mash.new(
  :username => 'admin',
  :email => 'admin@example.com',
  :password => 'secret'
)
