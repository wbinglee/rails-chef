name "rails"
description "Ruby on Rails with unicorn server & nginx."
run_list    "role[base]", "recipe[rvm::system]", "recipe[unicorn]", "recipe[user::data_bag]", "recipe[nginx]","recipe[rails::nginx]"