tempfile=$( mktemp )
cat $1/**/failed_login_data.txt | awk '{ print $4 }' | sort  | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);" }' >  $tempfile
touch data/username_dist.html
./bin/wrap_contents.sh $tempfile html_components/username_dist data/username_dist.html
cat data/username_dist.html
rm $tempfile
