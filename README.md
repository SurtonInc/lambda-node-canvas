# lambda-node-canvas

This is an example repository for creating a Lambda function that uses [node-canvas](https://github.com/Automattic/node-canvas) deployed as a container image.

## Building the container image

To build the container image, run the following command:

```bash
docker build -t lambda-node-canvas:latest .
```

## Pushing to Amazon ECR

To push the container image to Amazon ECR, run the following command:

```bash
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account_id>.dkr.ecr.<region>.amazonaws.com
docker tag lambda-node-canvas:latest <account_id>.dkr.ecr.<region>.amazonaws.com/lambda-node-canvas:latest
docker push <account_id>.dkr.ecr.<region>.amazonaws.com/lambda-node-canvas:latest
```

## Using the container image in Lambda

To use the container image in lambda, go through the following steps:

1. Create a new Lambda function using the `Container image` option.
2. Select the `lambda-node-canvas` image from Amazon ECR.
3. (Optional) Tweak the memory or timeout values in a production use case.
