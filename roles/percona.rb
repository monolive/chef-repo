name "percona"
description "Percona server role"

all_env = [ 
  "role[base]",
  "recipe[percona]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
)

