# Check existance of .env file within root directory:
if [ -f "./../.env" ]; then
    # Use specific .env file for hidden variables:
    source "./../.env"
fi

# change directory to udagram-frontend/:
cd ../udagram-frontend/

# Check ENV variable:
if [[ "$ENV" == "dev" ]]; then
    # Get start datetime:
    start_time=`date +%s`
fi

# Display message after deploying:
echo $'\n==> Start deleting script ...'

# Empty bucket:
echo $'==> Emptying bucket ... This may take a while.\n'
aws s3 rm --recursive s3://$AWS_BUCKET

# Delete bucket:
echo $'\n==> Deleting bucket ...'
aws s3api delete-bucket --bucket $AWS_BUCKET

# Display message after deploying:
echo $'\n==> Finished deleting script ...'

# Check ENV variable:
if [[ "$ENV" == "dev" ]]; then
    # Play a beep sound after finising:
    echo -en '\007'

    # Get end datetime:
    end_time=`date +%s`

    # Calculate runtime:
    echo "==> Execution runtime was `expr $end_time - $start_time` s."

    # Wait for any key to be pressed:
    read -p "==> Press any key to close the terminal ... " -n1 -s
fi
