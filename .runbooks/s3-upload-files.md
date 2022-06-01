# Upload Static Files onto S3 Bucket

Choose your preferred way then Follow its steps to upload your static files:

- Manual way:

  1. Upload specific files onto S3 bucket

      ```bash
      aws s3 cp --recursive --acl public-read ./www s3://<bucket-name>/
      ```

- Automated way:

  1. Navigate to `udagram-frontend/` directory.

  2. Run the following command:

      ```bash
      npm run s3:upload
      ```

[Go back to all available scripts](README.md)
