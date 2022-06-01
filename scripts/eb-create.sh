# Check existance of .env file within root directory:
if [ -f "./../.env" ]; then
    # Use specific .env file for hidden variables:
    source "./../.env"
fi

# Check ENV variable:
if [[ "$ENV" == "dev" ]]; then
    # Get start datetime:
    start_time=`date +%s`
fi

# Display message before deploying:
echo $'\n==> Start creating script ...'

# Initialize EB CLI:
echo $'==> Initializing EB CLI ...\n'
eb init $EB_APP_NAME --region $AWS_REGION --platform node.js --profile $AWS_PROFILE

# Create new environment:
echo $'\n==> Creating new environment ... This may take a while.\n'
eb create --sample $EB_ENVIRONMENT

# Add deployment artifact into config.yml file:
echo $'\n==> Adding deployment artifact into config.yml file ...'
echo $'deploy:\n  artifact: www/Archive.zip' >> .elasticbeanstalk/config.yml

# Display message after deploying:
echo "==> Finished creating script ..."

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
