
include_recipe 'runit'

runit_service 'gitpaste'

service "gitpaste" do
  supports :status => true, :restart => true, :reload => false
  restart_command "#{node[:gitpaste][:red_unicorn]} --pid-file #{node[:gitpaste][:gunicorn][:pid]} " +
    "--unicorn-exec #{node[:gitpaste][:gunicorn][:exec]} --kind gunicorn --unicorn-config "+
    "#{node[:gitpaste][:gunicorn][:config]} restart"
end
