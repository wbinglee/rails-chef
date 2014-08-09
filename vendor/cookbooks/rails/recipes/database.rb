
# Create user and db
database_username =  node['postgresql']['user']['name']
database_password =  node['postgresql']['user']['password']

database_name = node['postgresql']['database']

execute "create-database-user" do
  psql = "psql -U postgres -c \"create user \\\"#{database_username}\\\" with password '#{database_password}'\""
  user 'postgres'
  command psql
  returns [0,1]
end

execute "create-database" do
  user 'postgres'
  command "createdb -U postgres -O #{database_username} #{database_name}"
  returns [0,1]
end
