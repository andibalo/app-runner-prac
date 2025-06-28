## PUSHING LOCAL IMAGE TO ECR (AWS)
1. Create private ECR Repository on AWS
2. Authenthicate your private ECR in your local docker. View push commands in AWS dashboard. `aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 123456.dkr.ecr.ap-southeast-1.amazonaws.com`
3. After authenthicating, it will create your ECR credentials and store it in your OS Keychain/Credential store (If using Docker Desktop). Otherwise, It will store it in a special directory.
4. Build your docker image i.e. `docker build -t my-node-app .`
5. Tag your docker image with your ECR Image reference i.e. `docker tag my-node-app:latest 123456.dkr.ecr.ap-southeast-1.amazonaws.com/my-node-app:latest`
6. Push your image to ECR i.e. `docker push 123456.dkr.ecr.ap-southeast-1.amazonaws.com/my-node-app:latest`