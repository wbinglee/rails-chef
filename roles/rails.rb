name "rails"
description "Ruby on Rails with unicorn server & nginx."
run_list    "role[base]", "recipe[rbenv::default]", "recipe[ruby_build]","recipe[unicorn]", "recipe[user::data_bag]", "recipe[nginx]","recipe[rails::nginx]"