tempfile=$( mktemp )
shopt -s globstar
cat $1/**/failed_login_data.txt | awk '{ print $4 }' | sort  | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);" }' >  $tempfile
./bin/wrap_contents.sh $tempfile html_components/username_dist $1/username_dist.html
rm $tempfile
