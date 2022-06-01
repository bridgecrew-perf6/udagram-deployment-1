# Stop Specific RDS DB Instance

Choose your preferred way then Follow its steps to stop a specific RDS database Instance:

- Manual way:

  1. Stop RDS database instance

      ```bash
      aws rds stop-db-instance --db-instance-identifier <instance-name>
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run rds:stop
      ```

[Go back to all available scripts](README.md)
