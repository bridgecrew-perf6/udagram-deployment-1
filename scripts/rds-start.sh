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
echo $'\n==> Start starting script ...'

# Start RDS instance:
echo $'==> Starting RDS instance ... This may take a while.\n'
aws rds start-db-instance --db-instance-identifier $RDS_INSTANCE

# Wait until RDS instance is available:
echo $'\n==> Waiting for RDS instance to be available ... This may take a while.'
aws rds wait db-instance-available --db-instance-identifier $RDS_INSTANCE

# Display message after deploying:
echo "==> Finished starting script ..."

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
