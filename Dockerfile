FROM debian:8
MAINTAINER Ryar Nyah <ryarnyah@gmail.com>

LABEL CLOUD_PROVIDER aws
LABEL COMPONENT kubectl
LABEL VERSION stable

RUN apt-get update && \
	apt-get install -y curl python-pip groff && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl && \
	curl -LO https://github.com/kubernetes/kops/releases/download/v${KOPS_VERSION}/kops-linux-amd64 && \
	chmod +x kops-linux-amd64 && \
	mv kops-linux-amd64 /usr/local/bin/kops && \
	pip install awscli && \
	apt-get remove --purge curl

