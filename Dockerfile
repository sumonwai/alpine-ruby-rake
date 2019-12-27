FROM ruby:2.6.5-alpine3.9

MAINTAINER sumonwai@gmail.com

# Add required make for rubocop
RUN apk add --update alpine-sdk

# Install rake and other required packages
RUN gem install rake rubocop mustache

# Install azure-cli
RUN \
  apk update && \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
  pip --no-cache-dir install -U pip && \
  pip --no-cache-dir install azure-cli && \
  apk del --purge build

# Install terraform and ansiable
ENV TERRAFORM_VERSION 0.12.1
RUN apk add --update wget ca-certificates unzip python py-pip openssl bash && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi && \
    pip install ansible==2.1 && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* /terraform.zip

VOLUME /space

# Starting with ash ready
ENTRYPOINT ["ash"]




