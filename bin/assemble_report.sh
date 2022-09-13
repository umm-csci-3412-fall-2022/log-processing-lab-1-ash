tempfile=$( mktemp )

cat $1/country_dist.html $1/hours_dist.html $1/username_dist.html > $tempfile
./bin/wrap_contents.sh $tempfile html_components/summary_plots data/failed_login_summary.html
rm $tempfile
