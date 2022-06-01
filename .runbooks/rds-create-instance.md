# Create RDS DB Instance

Choose your preferred way then Follow its steps to create a new RDS database Instance:

- Manual way:

  1. Create a new RDS instance with the following parameters

      ```bash
      aws rds create-db-instance \
            --engine postgres --engine-version 12.8 \
            --db-instance-identifier <instance-name> \
            --master-username <value> --master-user-password <value> \
            --db-instance-class db.t2.micro \
            --storage-type gp2 --allocated-storage <value> \
            --publicly-accessible \
            --db-name <database-name> \
            --backup-retention-period 0 \
            --no-multi-az \
            --availability-zone <value> \
            --port <value> \
            --network-type IPV4
      ```

  2. Disable storage autoscaling for RDS instance

      ```bash
      aws rds modify-db-instance \
            --db-instance-identifier <instance-name> \
            --max-allocated-storage <same-value-as-allocated-storage> \
            --apply-immediately
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run rds:create
      ```

[Go back to all available scripts](README.md)
