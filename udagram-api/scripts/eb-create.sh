# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start creating script ...'

# change directory to udagram-api/:
cd ../

# Initialize EB CLI:
echo $'==> Initializing EB CLI ...\n'
eb init udagram-api --region us-east-1 --platform node.js --profile default

# Create new environment:
echo $'\n==> Creating new environment ... This may take a while.\n'
eb create --sample udagram-api-env

# Add deployment artifact into config.yml file:
echo $'\n==> Adding deployment artifact into config.yml file ...'
echo $'deploy:\n  artifact: www/Archive.zip' >> .elasticbeanstalk/config.yml

# Play a beep sound after finising:
echo "==> Finished creating script ..."
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
