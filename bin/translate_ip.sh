grep --color=NEVER $1 etc/country_IP_map.txt | awk 'match($0, /([A-Z]+)/, groups) { print groups[1] }'
