# Deploy to EB environment

Choose your preferred way then Follow its steps to deploy to a specific EB environment:

- Manual way:

  1. Use specific EB environment

      ```bash
      eb use <environment-name>
      ```

  2. Deploy to EB environment

      ```bash
      eb deploy <environment-name>
      ```

  3. Set EB environment variables

      ```bash
      eb setenv <variable-name> <variable-value>
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run eb:deploy
      ```

[Go back to all available scripts](README.md)
