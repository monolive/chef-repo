name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[vim]",
  "recipe[collectd]"
) 
