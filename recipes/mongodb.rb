cookbook_file "10gen.repo" do
  source "/etc/yum.repos.d/10gen.repo"
end

%w{mongo-10gen}.each do |pkg|
  package pkg do
    action :install
  end
end
 
service "mongod" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end