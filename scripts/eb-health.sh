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
echo $'\n==> Start checking health script ...'

# Check health:
echo "==> Checking EB environment health ... This may take a while."
eb health $EB_ENVIRONMENT

# Display message after deploying:
echo "==> Finished checking health script ..."

# Check ENV variable:
if [ "$ENV" == "dev" ]; then
    # Play a beep sound after finising:
    echo -en '\007'

    # Get end datetime:
    end_time=`date +%s`

    # Calculate runtime:
    echo "==> Execution runtime was `expr $end_time - $start_time` s."

    # Wait for any key to be pressed:
    read -p "==> Press any key to close the terminal ... " -n1 -s
fi
