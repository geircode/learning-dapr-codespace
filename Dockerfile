FROM geircodeacr.azurecr.io/learning-dapr-codespace-filecontainer:latest as filecontainer

FROM geircodeacr.azurecr.io/learning-dapr-codespace-base

RUN apt-get update

WORKDIR /app
COPY . /app

# Make all shell scripts default executable
WORKDIR /git
RUN find . -name "*.sh" -print && \
    find /app -name "*.sh" -execdir chmod u+x {} +

################################################################################
### Install stuff from filecontainer
################################################################################

WORKDIR /files
COPY --from=filecontainer /files .
RUN ls -al

# Docker CLI
RUN tar --strip-components=1 -xvzf docker.tgz -C /usr/local/bin

# Get the Terraform files. Get newer version from: https://www.terraform.io/downloads.html
RUN unzip -q terraform_linux_amd64.zip -d /usr/bin && \
    terraform --version

RUN unzip -q tflint.zip -d /usr/bin && \
    tflint --version

# kubectl
RUN chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin

##############################################
### kubelogin
#############################################

RUN unzip -q kubelogin.zip -d /usr/bin && \
    kubelogin version && \
    az aks install-cli

################################################################################
### Add flux
################################################################################

# RUN bash install-flux.sh

################################################################################
### kubectx & kubens
################################################################################

RUN mv ./kubectx /usr/local/bin &&\
    mv ./kubens /usr/local/bin &&\    
    chmod +x /usr/local/bin/kubectx &&\
    chmod +x /usr/local/bin/kubens


################################################################################
### Add dotnet-certificate-tool
################################################################################
# WORKDIR /git/dotnet-certificate-tool
# RUN dotnet tool install --tool-path ./ dotnet-certificate-tool 

################################################################################
### Add color for ls, alias for terraform etc.
################################################################################
COPY .bashrc /root/.bashrc
RUN dos2unix /root/.bashrc

################################################################################
### Install Certificate
################################################################################
# COPY geircodenorge.pem /etc/ssl/certs/
# RUN update-ca-certificates --fresh

################################################################################
### Set default workspace directory
################################################################################

WORKDIR /app

# Download, make executable, and run the dotnet-install.sh script
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh && \
    ./dotnet-install.sh --version latest

# Download and run the Dapr install script, then initialize Dapr
RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash && \
    dapr init


ENTRYPOINT tail -f /dev/null