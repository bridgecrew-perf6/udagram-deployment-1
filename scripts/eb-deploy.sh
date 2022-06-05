# Check existance of .env file within root directory:
if [ -f "./../.env" ]; then
    # Use specific .env file for hidden variables:
    source "./../.env"
fi

# Check ENV variable:
if [ "$ENV" == "dev" ]; then
    # Get start datetime:
    start_time=`date +%s`
fi

# Display message before deploying:
echo $'\n==> Start deploying script ...'

# Check ENV variable:
if [ "$ENV" != "dev" ]; then
    # Initialize EB CLI:
    echo $'==> Initializing EB CLI ...\n'
    eb init $EB_APP_NAME --region $AWS_REGION --platform node.js --profile $AWS_PROFILE

    # Add deployment artifact into config.yml file:
    echo $'\n==> Adding deployment artifact into config.yml file ...'
    echo $'deploy:\n  artifact: www/Archive.zip' >> .elasticbeanstalk/config.yml
fi

# Use specific environment:
echo "==> Using specific EB environment ..."
eb use $EB_ENVIRONMENT

# Deploy to specific environment:
echo $'==> Deploying to EB environment ... This may take a while.\n'
eb deploy $EB_ENVIRONMENT

# Set environment variables:
echo $'\n==> Setting environment variables ... This may take a while.\n'
eb setenv \
        ENV=$ENV \
        PORT=$PORT \
        POSTGRES_HOST=$POSTGRES_HOST \
        POSTGRES_PORT=$POSTGRES_PORT \
        POSTGRES_DB=$POSTGRES_DB \
        POSTGRES_USERNAME=$POSTGRES_USERNAME \
        POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
        AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
        AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
        AWS_REGION=$AWS_REGION \
        AWS_PROFILE=$AWS_PROFILE \
        AWS_BUCKET=$AWS_BUCKET \
        RDS_DIALECT=$RDS_DIALECT \
        RDS_INSTANCE=$RDS_INSTANCE \
        EB_APP_NAME=$EB_APP_NAME \
        EB_ENVIRONMENT=$EB_ENVIRONMENT \
        URL=$URL \
        JWT_SECRET=$JWT_SECRET

# Display message after deploying:
echo $'\n==> Finished deploying script ...'

# Check ENV variable:
if [ "$ENV" == "dev" ]; then
    # Play a beep sound after finising:
    echo -en "\007"

    # Get end datetime:
    end_time=`date +%s`

    # Calculate runtime:
    echo "==> Execution runtime was `expr $end_time - $start_time` s."

    # Wait for any key to be pressed:
    read -p "==> Press any key to close the terminal ... " -n1 -s
fi
