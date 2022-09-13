tempdir=$( mktemp -d )


for arg in "$@"
do
  filename=$( echo $arg | awk 'match($0, /\/([^.]+)\.tgz/, groups) { print groups[1] }' )
  mkdir $tempdir/$filename
  tar -xzf $arg -C $tempdir/$filename

  ./bin/process_client_logs.sh $tempdir/$filename
done

./bin/create_username_dist.sh $tempdir
./bin/create_hours_dist.sh $tempdir
./bin/create_country_dist.sh $tempdir
./bin/assemble_report.sh $tempdir

cp $tempdir/failed_login_summary.html failed_login_summary.html

rm -rf $tempdir
