#nginx config for unicorn

#Support mutiple apps?
app = node['rails']['app']

template "/etc/nginx/sites-available/#{app['name']}.conf" do
  source "app_nginx.conf.erb"
  variables :name => app['name'], :domain_names => app['domain_names'], :deploy_path => app['deploy_path']
  notifies :reload, resources(:service => "nginx")
end

nginx_site "#{app['name']}.conf" do
  action :enable
end