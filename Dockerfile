FROM alpine:3.11

ARG KUBECTL_VERSION="1.15.10"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator
RUN curl -L -o /usr/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]