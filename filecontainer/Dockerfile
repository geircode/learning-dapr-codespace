FROM library/alpine as filecontainer

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl jq

WORKDIR /files
COPY . /files

##############################################
### Docker CLI
#############################################
ARG docker_latest_version_file_arg="docker-19.03.2.tgz"
ENV DOCKER_LATEST_VERSION_FILE=${docker_latest_version_file_arg}
RUN echo "Download => https://download.docker.com/linux/static/stable/x86_64/${DOCKER_LATEST_VERSION_FILE}"
RUN curl -fL https://download.docker.com/linux/static/stable/x86_64/${DOCKER_LATEST_VERSION_FILE} -o docker.tgz

##############################################
### Terraform
#############################################
# ARG TERRAFORM_VERSION=1.0.8
# RUN echo "Download => https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
# RUN curl -fL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_linux_amd64.zip

## Get latest
RUN echo "$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep -v 'rc|beta|alpha' | egrep 'linux.*amd64'  | tail -1)"
RUN curl -fl $(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep -v 'rc|beta|alpha' | egrep 'linux.*amd64'  | tail -1) -o terraform_linux_amd64.zip

##############################################
### tflint
#############################################
ARG TFLINT_VERSION=0.24.1
RUN echo "Download =>   v${TFLINT_VERSION}/tflint_linux_amd64.zip"
RUN curl -fL https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip -o tflint.zip

##############################################
### kubectl - latest
#############################################
RUN echo "Download =>   https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

##############################################
### kubelogin
#############################################
ARG KUBELOGIN_VERSION="v1.22.1"
RUN echo "Download =>   https://github.com/int128/kubelogin/releases/download/${KUBELOGIN_VERSION}/kubelogin_linux_amd64.zip"
RUN curl -fL https://github.com/int128/kubelogin/releases/download/${KUBELOGIN_VERSION}/kubelogin_linux_amd64.zip -o kubelogin.zip

##############################################
### Flux
#############################################
RUN echo "Download =>  https://fluxcd.io/install.sh"
RUN curl -fL https://fluxcd.io/install.sh -o install-flux.sh

##############################################
### kubens & kubectx
#############################################
# ENV VERSION "0.6.3"
# Get latest release tag for a GitHub repository
RUN echo "VERSION=$(curl -s https://api.github.com/repos/ahmetb/kubectx/releases/latest | jq -r ".tag_name")"
RUN export VERSION=$(curl -s https://api.github.com/repos/ahmetb/kubectx/releases/latest | jq -r ".tag_name") && \
    curl -L -o kubectx https://raw.githubusercontent.com/ahmetb/kubectx/v$VERSION/kubectx &&\
	curl -L -o kubens https://raw.githubusercontent.com/ahmetb/kubectx/v$VERSION/kubens

RUN ls -al

ENTRYPOINT tail -f /dev/null