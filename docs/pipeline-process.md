# Pipeline Process

This is how the website is deployed automatically via CircleCI.

## Workflow

In this section, you will find simple explanation for the configured CircleCI full cycle.

### Steps

1. The developer commits changes locally using Git.
2. The developer pushes commits to the remote repository.
3. CircleCI senses changes over remote repository.
4. CircleCI starts building project's workflow.
5. If build process is passed, CircleCI updates the website deployed on AWS.

### Diagram

![CircleCI Loop Image](../reviews/Overview/circleci-loop.png)
