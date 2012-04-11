include_recipe 'bluepill'
gem_package 'red_unicorn'

template File.join(node[:bluepill][:conf_dir], 'gitpaste.pill') do
  source 'gitpaste.pill.erb'
  mode 0644
  variables(
    :working_dir => File.join(node[:gitpaste][:directory], 'repository', 'saic'),
    :red_unicorn_exec => node[:gitpaste][:red_unicorn],
    :gunicorn_exec => node[:gitpaste][:gunicorn][:exec],
    :pid_file => node[:gitpaste][:gunicorn][:pid],
    :config_file => node[:gitpaste][:gunicorn][:config],
    :pill_log => File.join(node[:gitpaste][:directory], 'pill.log'),
    :process_log => File.join(node[:gitpaste][:directory], 'process.log'),
    :process_user => node[:nginx][:user]
  )
end

bluepill_service "gitpaste" do
  action [:enable, :load]
end

service "gitpaste" do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end
