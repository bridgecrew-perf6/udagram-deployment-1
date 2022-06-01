# Delete S3 Bucket

Choose your preferred way then Follow its steps to delete specific S3 bucket:

- Manual way:

  1. Empty bucket

      ```bash
      aws s3 rm --recursive s3://<bucket-name>
      ```

  2. Delete bucket

      ```bash
      aws s3api delete-bucket --bucket <bucket-name>
      ```

- Automated way:

  1. Navigate to `udagram-frontend/` directory.

  2. Run the following command:

      ```bash
      npm run s3:delete
      ```

[Go back to all available scripts](README.md)
