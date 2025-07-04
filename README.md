## Architecture Overview
![Untitled Diagram drawio](https://github.com/user-attachments/assets/94a921a9-8b7e-4aeb-9a28-5acec187232d)

## Setting Up The Deployment Workflow
1. Create an ECR Repository and upload a container image
2. Create App Runner with image source from ECR repository in step 1 and enable automatic deployment. Automatic deployment will watch for image revisions in the ECR repository and redeploy.
3. Create Codebuild with source code provider from github. Ensure you have logged in to your github account in AWS via OAUTH. First time using OAUTH will create a secret for the connection to github. The secret contains access token whcih grants Codebuild access to the target github account repositories.
4. After logging in to your github, set the repository source and enable webook. Webhook will listen to events PUSH, PR MERGE, etc. and trigger the codebuild pipeline. Write the commands to run in the pipeline that will build the source code from provider (i.e. github) and push to ECR. Refer to [PUSHING LOCAL IMAGE TO ECR (AWS)](#pushing-local-image-to-ecr-aws) for the commands.

## PUSHING LOCAL IMAGE TO ECR (AWS)
1. Create private ECR Repository on AWS
2. Authenthicate your private ECR in your local docker. View push commands in AWS dashboard. `aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 123456.dkr.ecr.ap-southeast-1.amazonaws.com`
3. After authenthicating, it will create your ECR credentials and store it in your OS Keychain/Credential store (If using Docker Desktop). Otherwise, It will store it in a special directory.
4. Build your docker image i.e. `docker build -t my-node-app .`
5. Tag your docker image with your ECR Image reference i.e. `docker tag my-node-app:latest 123456.dkr.ecr.ap-southeast-1.amazonaws.com/my-node-app:latest`
6. Push your image to ECR i.e. `docker push 123456.dkr.ecr.ap-southeast-1.amazonaws.com/my-node-app:latest`

## What is AWS App Runner?
AWS App Runner is a fully managed service that simplifies the process of deploying and running containerized web applications and APIs without having to manage infrastructure. It allows developers to build and deploy applications quickly with minimal configuration. Here are the key features:

- **Automatic Scaling**: App Runner automatically scales the application up or down based on traffic.

- **Simplified Deployment**: You can deploy directly from your source code repository (such as GitHub or AWS CodeCommit) or from a container image.

- **Fully Managed**: App Runner handles everything from provisioning the underlying infrastructure to patching, monitoring, and load balancing.

- **Secure and Easy**: Built-in HTTPS support and security options like automatic encryption, role-based access, and private networking.

In essence, AWS App Runner makes it easier to deploy web apps without worrying about managing the server infrastructure.

## What is AWS Codebuild?
AWS CodeBuild is a fully managed build service in AWS. It allows developers to automatically compile source code, run tests, and produce ready-to-deploy artifacts. Here are the key features:

- **Continuous Integration**: CodeBuild integrates well with AWS CodePipeline and other CI/CD tools to create continuous integration (CI) workflows.

- **Custom Build Environments**: You can define custom environments for different programming languages or frameworks (e.g., Java, Python, Node.js, etc.) or use predefined environments.

- **Scalable**: CodeBuild scales automatically to handle multiple build requests simultaneously. It can support large-scale applications and manage heavy workloads.

- **Pay-Per-Use**: You only pay for the time your builds run, making it cost-effective for both small and large projects.

In simple terms, AWS CodeBuild automates the process of building and testing your code. It can be used as part of a CI/CD pipeline to ensure that every change made to your application is built and tested before deployment.
