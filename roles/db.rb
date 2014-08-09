name "db"
description "Postgresql server."
run_list    "role[base]", "recipe[postgresql::server]", "recipe[postgresql::client]", "recipe[rails::database]"