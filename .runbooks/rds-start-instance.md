# Start Specific RDS DB Instance

Choose your preferred way then Follow its steps to start a specific RDS database Instance:

- Manual way:

  1. Start RDS database instance

      ```bash
      aws rds start-db-instance --db-instance-identifier <instance-name>
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run rds:start
      ```

[Go back to all available scripts](README.md)
