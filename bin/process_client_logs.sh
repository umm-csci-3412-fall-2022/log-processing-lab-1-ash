pushd $( pwd ) > /dev/null
cd "$1"
regex="^([a-zA-Z]+) ([0-9]+) ([0-9]+):[0-9:]+ ([a-zA-Z0-9_-]+) [^:]+: Failed password for (invalid user )?([a-zA-Z0-9_-]+) from ([0-9.]+).*$"
cat var/log/* | awk -e '/Failed password/ {print $0}' | awk 'match($0, /^([a-zA-Z]+) *([0-9]+) *([0-9]+):[0-9:]+ ([a-zA-Z0-9_-]+) [^:]+: Failed password for (invalid user )?([a-zA-Z0-9_-]+) from ([0-9.]+).*$/, groups) {print groups[1] " " groups[2] " " groups[3] " " groups[6] " " groups[7]}' > failed_login_data.txt
popd > /dev/null
