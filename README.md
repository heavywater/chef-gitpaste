GitPaste Cookbook
=================

This cookbook installs and configures gitpaste. Currently supported configuration:

* ubuntu
* nginx
* bluepill/runit

Attributes:
-----------

* node[:gitpaste][:directory] = '/var/www/gitpaste'                  # base installation directory
* node[:gitpaste][:init_type] = :bluepill                            # init type to use (bluepill/runit). defaults to bluepill
* node[:gitpaste][:gunicorn][:workers] = 4                           # number of worker processes
* node[:gitpaste][:gunicorn][:listen] = nil                          # gunicorn socket (tcp/unix). defaults to unix socket
* node[:gitpaste][:gunicorn][:pid] = nil                             # location of pid file
* node[:gitpaste][:gunicorn][:exec] = nil                            # path to gunicorn executable
* node[:gitpaste][:gunicorn][:config] = '/etc/gunicorn/gitpaste.app' # path to gunicorn config file
* node[:gitpaste][:superuser][:username] = 'admin'                   # django superuser username
* node[:gitpaste][:superuser][:passowrd] = 'secret'                  # django superuser password
* node[:gitpaste][:superuser][:email] = 'admin@example.com'          # django superuser email

Django Superuser
----------------

The django super user is created on application creation and the attributes
are no longer useful after the first run.

Github
------

http://github.com/heavywater/chef-gitpaste

More Info
---------
gitpaste: http://github.com/justinvh/gitpaste

