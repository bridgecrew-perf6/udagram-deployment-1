# Check EB environment health

Choose your preferred way then Follow its steps to check health of an EB environment:

- Manual way:

  1. Use specific EB environment

      ```bash
      eb use <environment-name>
      ```

  2. Check EB environment health

      ```bash
      eb health <environment-name>
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run eb:health
      ```

[Go back to all available scripts](README.md)
