# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start checking health script ...'

# change directory to udagram-api/:
cd ../

# Check health:
echo "==> Checking EB environment health ... This may take a while."
eb health udagram-api-env

# Play a beep sound after finising:
echo "==> Finished checking health script ..."
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
