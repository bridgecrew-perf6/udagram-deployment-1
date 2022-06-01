# Create EB application

Choose your preferred way then Follow its steps to create an EB application with sample environment:

- Manual way:

  1. Create new EB application

      ```bash
      eb init <application-name> \
          --region us-east-1 \
          --platform node.js \
          --profile default
      ```

  2. Create sample EB environment

      ```bash
      eb create --sample <environment-name>
      ```

- Automated way:

  1. Navigate to `udagram-api/` directory.

  2. Run the following command:

      ```bash
      npm run eb:create
      ```

[Go back to all available scripts](README.md)
