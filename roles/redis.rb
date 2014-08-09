name "redis"
description "redis server."
run_list    "role[base]","recipe[redisio::install]","recipe[redisio::enable]"