# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start terminating script ...'

# change directory to udagram-api/:
cd ../

# Initialize EB CLI:
echo $'==> Terminating EB environment and its application ... This may take a while.\n'
eb terminate udagram-api-env --all --force

# Play a beep sound after finising:
echo $'\n==> Finished terminating script ...'
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
