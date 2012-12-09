name "webserver"
description "Web server role"
all_env = [ 
  "role[base]",
  "recipe[apache2]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
)
