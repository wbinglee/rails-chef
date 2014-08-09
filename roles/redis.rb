name "web"
description "nginx web server."
run_list    "role[base]", "recipe[nginx]","recipe[redisio::install]","recipe[redisio::enable]"