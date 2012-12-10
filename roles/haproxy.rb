name "haproxy"
description "HA Proxy Server"
all_env = [ 
  "role[base]",
  "recipe[haproxy]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  "dev" => all_env,
)
