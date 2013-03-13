filename = "php-5.3.22-1.el6_7.wing.x86_64.rpm"

cookbook_file "/tmp/#{filename}" do
  source "#{filename}"
end

package "php" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{filename}"
end
 
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end