FROM public.ecr.aws/lambda/nodejs:16

# Install OS dependencies
RUN yum install -y gcc-c++ cairo-devel pango-devel libjpeg-turbo-devel giflib-devel zlib-devel librsvg2-devel

# Copy function code
COPY package*.json index.js ${LAMBDA_TASK_ROOT}

WORKDIR ${LAMBDA_TASK_ROOT}

RUN npm ci

ENV LD_PRELOAD=/var/task/node_modules/canvas/build/Release/libz.so.1

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "index.handler" ]