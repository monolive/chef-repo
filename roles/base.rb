name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[git]",
  "recipe[vim]",
  "recipe[yum]",
) 
