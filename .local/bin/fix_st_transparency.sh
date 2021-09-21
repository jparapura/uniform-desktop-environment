#!/bin/bash

# If you spawn st with alpha patch, first window is
# transparent slightly less than expected. If you spawn
# another st, then first window gets regular transparency
# but second one inherits the problem from the first window.
# BUT if you close them all and spawn two sts again,
# the issue is gone. This script solves the issue of 
# inconsistent transparency by
# spawning a lot of sts (e.g. 10) on 9'th tab
# and kills them after a second. Unless you spawn 11 sts
# at once, you won't encounter the problem.

declare -a st_pids
sts_to_spawn=10

spawn_st () {
	st -c "HomeTab" &
	st_pids+=($!)
}

print_sts () {
	for v in "${st_pids[@]}"; do
		printf "$v "
	done
	printf "\n"
}

#print_sts
for i in $(seq 1 $sts_to_spawn); do
	spawn_st
done
#print_sts
sleep 1
kill ${st_pids[@]}
#print_sts
