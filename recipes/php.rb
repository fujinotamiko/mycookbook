%w{php}.each do |pkg|
  package pkg do
    action :install
  end
end
 
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end