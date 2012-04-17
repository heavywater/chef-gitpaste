maintainer 'Chris Roberts'
maintainer_email 'chrisroberts.code@gmail.com'
license 'Apache 2.0'
description 'Installs and configures gitpaste pastebin app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.3'

%w(python gunicorn nginx bluepill runit).each do |dep_book|
  depends dep_book
end

supports 'ubuntu'
