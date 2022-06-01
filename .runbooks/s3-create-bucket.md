# Create S3 Bucket

Choose your preferred way then Follow its steps to create a new S3 bucket:

- Manual way:

  1. Create new S3 bucket

      ```bash
      aws s3api create-bucket --bucket <bucket-name> --region us-east-1
      ```

  2. Allow public access

      ```bash
      aws s3api put-public-access-block --bucket <bucket-name> \
            --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false
      ```

  3. Set bucket policy

      ```bash
      aws s3api put-bucket-policy --bucket <bucket-name> \
            --policy <configuration-json-file>
      ```

  4. Configure static website

      ```bash
      aws s3api put-bucket-website --bucket <bucket-name> \
            --website-configuration <configuration-json-file>
      ```

- Automated way:

  1. Navigate to `udagram-frontend/` directory.

  2. Run the following command:

      ```bash
      npm run s3:create
      ```

[Go back to all available scripts](README.md)
