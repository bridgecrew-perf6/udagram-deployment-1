# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start deploying script ...'

# change directory to udagram-api/:
cd ../

# Use specific .env file for hidden variables:
source .env

# Use specific environment:
echo "==> Using specific EB environment ..."
eb use udagram-api-env

# Deploy to specific environment:
echo $'==> Deploying to EB environment ... This may take a while.\n'
eb deploy udagram-api-env

# Set environment variables:
echo $'\n==> Setting environment variables ... This may take a while.\n'
eb setenv PORT=$PORT POSTGRES_HOST=$POSTGRES_HOST POSTGRES_PORT=$POSTGRES_PORT POSTGRES_DB=$POSTGRES_DB POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD

# Play a beep sound after finising:
echo $'\n==> Finished deploying script ...'
echo -en "\007"

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
