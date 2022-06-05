# Application Dependencies

## Frond-End

Angular website implemented using TypeScript.

### Manual Deployment for Front-End

To deploy this directory, you need to follow the commands below:

1. *Navigate inside this directory*:

    ```bash
    cd udagram-frontend/
    ```

2. *Install dependencies*:

    ```bash
    npm install
    ```

3. *Build this directory*:
    - **For production**:

        ```bash
        npm run build:prod
        ```

    - **For development**:

        ```bash
        npm run build:dev
        ```

    NOTE: This will create a new sub-directory (`www/`) which will be uploaded onto AWS S3 bucket.

4. *Upload onto AWS S3*:

    ```bash
    npm run s3:upload
    ```

### Front-End Production Environment

- NodeJS v14.15.1
- npm v6.14.8
- Angular v8
- AWS CLI v2
- AWS Simple Storage Service (S3)

<hr>

## Back-End

Express API implemented using TypeScript.

### Manual Deployment for Back-End

To deploy this directory, you need to follow the commands below:

1. *Navigate inside this directory*:

    ```bash
    cd udagram-api/
    ```

2. *Install dependencies*:

    ```bash
    npm install
    ```

3. *Build this directory*:

    ```bash
    npm run build
    ```

    NOTE: This will create a new sub-directory (`www/`). Within this created directory, you will find a zip file (`Archive.zip`) which will be deployed onto AWS EB environment.

4. *Deploy onto AWS EB*:

    ```bash
    npm run eb:deploy
    ```

### Back-End Production Environment

- NodeJS v14.15.1
- npm v6.14.8
- ExpressJS
- AWS CLI v2
- AWS Relational Database Service (RDS)
- AWS Elastic Beanstalk (EB)
