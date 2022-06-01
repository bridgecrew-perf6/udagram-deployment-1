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

# Create RDS instance:
echo $'==> Creating RDS instance ... \n'
aws rds create-db-instance \
            --engine postgres --engine-version 12.8 \
            --db-instance-identifier $RDS_INSTANCE \
            --master-username $POSTGRES_USERNAME --master-user-password $POSTGRES_PASSWORD \
            --db-instance-class db.t2.micro \
            --storage-type gp2 --allocated-storage 20 \
            --publicly-accessible \
            --db-name $POSTGRES_DB \
            --backup-retention-period 0 \
            --no-multi-az \
            --availability-zone us-east-1d \
            --port 5432 \
            --network-type IPV4

# Disable storage autoscaling for RDS instance:
echo $'\n==> Disabling storage autoscaling for RDS instance ...\n'
aws rds modify-db-instance \
            --db-instance-identifier $RDS_INSTANCE \
            --max-allocated-storage 20 \
            --apply-immediately

# Wait until RDS instance is available:
echo $'\n==> Waiting for RDS instance to be available ... This may take a while.'
aws rds wait db-instance-available --db-instance-identifier $RDS_INSTANCE

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
