<!-- Project title -->
# Udagram AWS Deployment

<!-- Describe your project in brief -->
Deploy a full-stack website onto AWS - Advanced Web Development egFWD - Third Project

This project was implemented upon a starter project provided by Udacity. Here is the [starter project](https://github.com/udacity/nd0067-c4-deployment-process-project-starter) repository.

You can find the website deployed on AWS S3 via [live website link](http://mokhtar-udagram-bucket.s3-website-us-east-1.amazonaws.com).

# Table of Contents

- [Udagram AWS Deployment](#udagram-aws-deployment)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Development](#development)
  - [Architecture](#architecture)
- [Installed NPM Packages](#installed-npm-packages)
  - [Development Packages](#development-packages)
- [Useful Resources](#useful-resources)

# Installation

[(Back to top)](#table-of-contents)

To use this project, you need to follow the commands below:

1. Clone the repository into your local machine:

   ```bash
   git clone https://github.com/ibrahimelmokhtar/udagram-deployment.git
   ```

2. Redirect inside the cloned repository:

    ```bash
    cd udagram-deployment/
    ```

3. Install the required packages:

   ```bash
   npm install
   ```

   NOTE: *this command will install ALL the required dependencies: server-side and client-side.*

4. Copy `example.env` file into `.env` file.

5. Fill the created `.env` file with corresponding/appropriate information.

6. *For applying configured styling*, run the following commands:
   - ***Prettier** styling*:

        ```bash
        npm run prettier
        ```

   - ***ESLint** styling*:

        ```bash
        npm run lint
        ```

7. *For running test scripts*, run the following command:

   ```bash
   npm run test
   ```

   NOTE: *this command will test both server and client sides.*

8. *For working with the **production** phase*, run the following commands:

   ```bash
   npm run build
   ```

    Then, *Deploy the built versions of both server and client sides*:

    ```bash
    npm run deploy
    ```

    Then, Open the website deployed on AWS S3 via the following link:

    ```http
    http://mokhtar-udagram-bucket.s3-website-us-east-1.amazonaws.com
    ```

# Development

[(Back to top)](#table-of-contents)
This section will explain **how the code works** and **how everything is put together.**

## Architecture

[(Back to top)](#table-of-contents)

This project has the structure shown below:

<details>
    <summary>Project Structure</summary>

```markdown
├─── circleci/
    └─── config.yml
├─── .runbooks/
   ├─── eb-check-health.md
   ├─── eb-create-application.md
   ├─── eb-deploy-environment.md
   ├─── eb-terminate-environment.md
   ├─── rds-create-instance.md
   ├─── rds-delete-instance.md
   ├─── rds-start-instance.md
   ├─── rds-stop-instance.md
   ├─── README.md
   ├─── s3-create-bucket.md
   ├─── s3-delete-bucket.md
   └─── s3-upload-bucket.md
├─── reviews/
   ├─── AWS EB/
      ├─── aws-eb-1.PNG
      └─── aws-eb-2.PNG
   ├─── AWS RDS/
      ├─── aws-rds-1.PNG
      └─── aws-rds-2.PNG
   ├─── AWS S3/
      ├─── aws-s3-1.PNG
      └─── aws-s3-2.PNG
   ├─── CircleCI Build/
      ├─── circleci-00-workflow.PNG
      ├─── circleci-10-install-client.PNG
      ├─── circleci-11-build-client.PNG
      ├─── circleci-12-deploy-client.PNG
      ├─── circleci-20-install-server.PNG
      ├─── circleci-21-build-server.PNG
      └─── circleci-22-deploy-server.PNG
   └─── CircleCI Environment/
      ├─── circleci-env-1.PNG
      └─── circleci-env-2.PNG
├─── scripts/
   ├─── eb-create.sh
   ├─── eb-deploy.sh
   ├─── eb-health.sh
   ├─── eb-terminate.sh
   ├─── rds-create.sh
   ├─── rds-delete.sh
   ├─── rds-start.sh
   ├─── rds-stop.sh
   ├─── s3-create.sh
   ├─── s3-delete.sh
   └─── s3-upload.sh
├─── udagram-api/
├─── udagram-frontend/
├─── .env
├─── .eslintignore
├─── .eslintrc
├─── .gitignore
├─── .prettierrc
├─── example.env
├─── package.json
└─── README.md
```

</details>

# Installed NPM Packages

[(Back to top)](#table-of-contents)

These packages are required to run this project smoothly without any errors.

## Development Packages

These packages can be found in the `"devDependencies"` object inside the `package.json` file.

- [@typescript-eslint/eslint-plugin](https://www.npmjs.com/package/@typescript-eslint/eslint-plugin) - TypeScript plugin for ESLint.
- [@typescript-eslint/parser](https://www.npmjs.com/package/@typescript-eslint/parser) - An ESLint custom parser which leverages TypeScript ESTree.
- [eslint](https://www.npmjs.com/package/eslint) - An AST-based pattern checker for JavaScript.
- [eslint-config-prettier](https://www.npmjs.com/package/eslint-config-prettier) - Turns off all rules that are unnecessary or might conflict with Prettier.
- [eslint-plugin-prettier](https://www.npmjs.com/package/eslint-plugin-prettier) - Runs prettier as an eslint rule.
- [prettier](https://www.npmjs.com/package/prettier) - Prettier is an opinionated code formatter.
- [typescript](https://www.npmjs.com/package/typescript) - TypeScript is a language for application scale JavaScript development.

# Useful Resources

[(Back to top)](#table-of-contents)

- [Documentation: Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Documentation: Install AWS EB CLI](https://github.com/aws/aws-elastic-beanstalk-cli-setup#eb-cli-installer)
- [Youtube Video: Install AWS EB CLI](https://www.youtube.com/watch?v=J9na_nTJYM8)
- [Documentation: Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Documentation: Manipulate AWS RDS via CLI](https://docs.aws.amazon.com/cli/latest/reference/rds/)
- [Documentation: Create a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateDBInstance.html)
- [Documentation: Manipulate AWS EB via CLI](https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/index.html)
- [Documentation: AWS EB CLI Commands](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-cmd-commands.html)
- [Documentation: Manipulate AWS S3 via CLI](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html)
- [Documentation: Configuring CircleCI](https://circleci.com/docs/2.0/configuration-reference/)
