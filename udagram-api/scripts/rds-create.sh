# Get start datetime:
start_time=`date +%s`

# Display message on deploy:
echo $'\n==> Start creating script ...'

# change directory to udagram-api/:
cd ../

# Create RDS instance:
echo $'==> Creating RDS instance ... \n'
aws rds create-db-instance \
            --engine postgres --engine-version 12.8 \
            --db-instance-identifier udagram \
            --master-username postgres --master-user-password postgres \
            --db-instance-class db.t2.micro \
            --storage-type gp2 --allocated-storage 20 \
            --publicly-accessible \
            --db-name udagram_db \
            --backup-retention-period 0 \
            --no-multi-az \
            --availability-zone us-east-1d \
            --port 5432 \
            --network-type IPV4

# Disable storage autoscaling for RDS instance:
echo $'\n==> Disabling storage autoscaling for RDS instance ...\n'
aws rds modify-db-instance \
            --db-instance-identifier udagram \
            --max-allocated-storage 20 \
            --apply-immediately

# Wait until RDS instance is available:
echo $'\n==> Waiting for RDS instance to be available ... This may take a while.'
aws rds wait db-instance-available --db-instance-identifier udagram

# Play a beep sound after finising:
echo "==> Finished creating script ..."
echo -en '\007'

# Get end datetime:
end_time=`date +%s`

# Calculate runtime:
echo "==> Execution runtime was `expr $end_time - $start_time` s."

# Wait for any key to be pressed:
read -p "==> Press any key to close the terminal ... " -n1 -s
