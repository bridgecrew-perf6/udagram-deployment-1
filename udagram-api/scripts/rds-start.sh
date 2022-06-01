# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start starting script ...'

# change directory to udagram-api/:
cd ../

# Start RDS instance:
echo $'==> Starting RDS instance ... This may take a while.\n'
aws rds start-db-instance --db-instance-identifier udagram

# Wait until RDS instance is available:
echo $'\n==> Waiting for RDS instance to be available ... This may take a while.'
aws rds wait db-instance-available --db-instance-identifier udagram

# Play a beep sound after finising:
echo "==> Finished starting script ..."
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
