tempfile=$( mktemp )
shopt -s globstar
cat $1/**/failed_login_data.txt | awk '{ system( "./bin/translate_ip.sh " $5 ) }' | sort | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);" }' >  $tempfile
./bin/wrap_contents.sh $tempfile html_components/country_dist $1/country_dist.html
rm $tempfile
