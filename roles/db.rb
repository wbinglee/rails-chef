name "db"
description "Postgresql server."
run_list    "role[base]", "recipe[mysql::server]", "recipe[mysql::client]"