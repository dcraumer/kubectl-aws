FROM debian:10

LABEL CLOUD_PROVIDER aws
LABEL COMPONENTS "kubectl,aws-cli"

ENV AWSCLI_VERSION 1.16.305

RUN apt-get update && \
	apt-get install -y git curl python-pip python-dev groff unzip libffi-dev libyaml-dev libssl-dev ca-certificates openssh-client jq vim python-netaddr graphviz && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl && \
	pip install --upgrade "awscli==${AWSCLI_VERSION}" && \
	apt-get autoclean -y

VOLUME /src
WORKDIR /src
