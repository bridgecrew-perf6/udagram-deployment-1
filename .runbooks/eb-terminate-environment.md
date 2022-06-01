# Terminate EB environment

Choose your preferred way then Follow its steps to terminate an EB environment with its application:

- Manual way:

  1. Use specific EB environment

      ```bash
      eb use <environment-name>
      ```

  2. Terminate EB environment and its application

      ```bash
      eb terminate <environment-name> --all --force
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run eb:terminate
      ```

[Go back to all available scripts](README.md)
