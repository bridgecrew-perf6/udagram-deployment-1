<!-- Project title -->
# Udagram Client Side

<!-- Describe your project in brief -->
Deploy a full-stack website onto AWS using CircleCI - Advanced Web Development egFWD - Third Project

# Table of Contents

- [Udagram Client Side](#udagram-client-side)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Development](#development)
  - [Architecture](#architecture)
- [Bucket Policy](#bucket-policy)

# Installation

[(Back to top)](#table-of-contents)

To use the available scripts within this directory, you need to follow the commands below:

1. *For building this directory*, run one of the following commands:

    - Using **development** environment:

        ```bash
        npm run build:dev
        ```

    - Using **production** environment:

        ```bash
        npm run build:prod
        ```

    NOTE: This will create a new sub-directory (`www/`). Within this created directory, you will find a zip file (`Archive.zip`) which will be deployed onto AWS EB environment.

2. *For manipulating AWS S3 bucket*, run the following commands:

   - ***Create** new bucket*:

        ```bash
        npm run s3:create
        ```

        NOTE: To see the bash script that will be executed via this command, check this [bash file](../scripts/s3-create.sh).

   - ***Upload** onto existing bucket*:

        ```bash
        npm run s3:upload
        ```

        NOTE: To see the bash script that will be executed via this command, check this [bash file](../scripts/s3-upload.sh).

   - ***Delete** existing bucket*:

        ```bash
        npm run s3:delete
        ```

        NOTE: To see the bash script that will be executed via this command, check this [bash file](../scripts/s3-delete.sh).

# Development

[(Back to top)](#table-of-contents)
This section will explain **how the code works** and **how everything is put together.**

## Architecture

[(Back to top)](#table-of-contents)

This project has the structure shown below:

<details>
    <summary>Project Structure</summary>

```markdown
├─── e2e/
    ├─── src/
        ├─── app.e2e-spec.ts
        └─── app.po.ts
    ├─── protractor.conf.js
    └─── tsconfig.e2e.json
├─── src/
    ├─── app/
        ├─── api/
            ├─── api.module.ts
            └─── api.service.ts
        ├─── auth/
            ├─── auth-login/
                ├─── auth-login.component.html
                ├─── auth-login.component.scss
                └─── auth-login.component.ts
            ├─── auth-menu-button/
                ├─── auth-menu-user/
                    ├─── auth-menu-user.component.html
                    ├─── auth-menu-user.component.scss
                    ├─── auth-menu-user.component.spec.ts
                    └─── auth-menu-user.component.ts
                ├─── auth-menu-button.component.html
                ├─── auth-menu-button.component.scss
                └─── auth-menu-button.component.ts
            ├─── auth-register/
                ├─── auth-register.component.html
                ├─── auth-register.component.scss
                └─── auth-register.component.ts
            ├─── models/
                └─── user.model.ts
            ├─── services/
                ├─── auth.guard.service.ts
                └─── auth.service.ts
            └─── auth.module.ts
        ├─── feed/
            ├─── feed-item/
                ├─── feed-item.component.html
                ├─── feed-item.component.scss
                ├─── feed-item.component.spec.ts
                └─── feed-item.component.ts
            ├─── feed-list/
                ├─── feed-list.component.html
                ├─── feed-list.component.scss
                └─── feed-list.component.ts
            ├─── feed-upload/
                ├─── feed-upload-button/
                    ├─── feed-upload-button.component.html
                    ├─── feed-upload-button.component.scss
                    └─── feed-upload-button.component.ts
                ├─── feed-upload.component.html
                ├─── feed-upload.component.scss
                └─── feed-upload.component.ts
            ├─── models/
                └─── feed-item.model.ts
            ├─── services/
                └─── feed.provider.service.ts
            └─── feed.module.ts
        ├─── home/
            ├─── home.module.ts
            ├─── home.page.html
            ├─── home.page.scss
            ├─── home.page.spec.ts
            └─── home.page.ts
        ├─── menubar/
            ├─── menubar.component.html
            ├─── menubar.component.scss
            ├─── menubar.component.spec.ts
            └─── menubar.component.ts
        ├─── app-routing.module.ts
        ├─── app.component.html
        ├─── app.component.spec.ts
        ├─── app.component.ts
        └─── app.module.ts
    ├─── assets/
        ├─── icon/
            ├─── icon/
                └─── favicon.png
        └─── shapes.svg
    ├─── environments/
        ├─── environment.prod.ts
        └─── environment.ts
    ├─── theme/
        └─── variables.scss
    ├─── global.scss
    ├─── index.html
    ├─── karma.conf.js
    ├─── main.ts
    ├─── polyfills.ts
    ├─── test.ts
    ├─── tsconfig.app.json
    └─── tsconfig.spec.json
├─── .eslintrc
├─── .gitignore
├─── angular.json
├─── bucket-policy.json
├─── bucket-website.json
├─── ionic-config.json
├─── package.json
├─── README.md
├─── tsconfig.json
└─── tslint.json
```

</details>

# Bucket Policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::mokhtar-udagram-bucket/*"
            ]
        }
    ]
}
```
