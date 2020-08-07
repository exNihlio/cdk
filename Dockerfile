FROM ubuntu:20.04


RUN export DEBIAN_FRONTEND=noninteractice && \
    apt-get update && \
    apt-get install -y npm \
                       vim \
                       git \
                       python3 \
                       python3-pip \
                       python3-ipython && \
    pip3 install boto3 && \
    npm install -g aws-cdk

COPY aws/ /root/aws
    
RUN bash /root/aws/install
