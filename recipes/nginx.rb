include_recipe 'nginx'

%w(default 000-default).each do |disable_site|
  nginx_site disable_site do
    enable false
    notifies :reload, "service[nginx]"
  end
end

template File.join(node['nginx']['dir'], 'sites-available', 'gitpaste.conf') do
  source 'nginx.conf.erb'
  mode 0644
  variables(
    :root => File.join(node[:gitpaste][:directory], *%w(
      repository saic paste
    )),
    :server => node[:gitpaste][:gunicorn][:listen]
  )
  if(::File.symlink?(File.join(node['nginx']['dir'], 'sites-enabled', 'gitpaste.conf')))
    notifies :reload, 'service[nginx]'
  end
end

nginx_site 'gitpaste.conf' do
  notifies :reload, 'service[nginx]'
end
