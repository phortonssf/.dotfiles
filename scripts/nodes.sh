#!/bin/bash

set -e

KUBECTL="kubectl"
NODES=$($KUBECTL get nodes --no-headers -o custom-columns=NAME:.metadata.name)

$KUBECTL describe nodes | grep "Allocated resources" -A 9 

function usage() {
	local node_count=0
	local total_percent_cpu=0
	local total_percent_mem=0
	local readonly nodes=$@

	for n in $nodes; do
		# local requests=$($KUBECTL describe node $n | grep -A2 -E "^\\s*CPU Requests" | tail -n1)
    # echo $requests
		# local percent_cpu=$(echo $requests | awk -F "[()%]" '{print $2}')
		# local percent_mem=$(echo $requests | awk -F "[()%]" '{print $8}')
		# echo "$n: ${percent_cpu}% CPU, ${percent_mem}% memory"

		node_count=$((node_count + 1))
		# total_percent_cpu=$((total_percent_cpu + percent_cpu))
		# total_percent_mem=$((total_percent_mem + percent_mem))
	done

	# local readonly avg_percent_cpu=$((total_percent_cpu / node_count))
	# local readonly avg_percent_mem=$((total_percent_mem / node_count))

	echo " Node Count: ${node_count} "
  # Average usage: ${avg_percent_cpu}% CPU, ${avg_percent_mem}% memory."
}

usage $NODES
