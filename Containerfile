FROM quay.io/centos/centos:stream9

LABEL MAINTAINER "Adrian Riobo" "<ariobolo@redhat.com>"



# TODO create asdf plugin for pulimictl
ENV PULUMICTL_VERSION v0.0.42
RUN curl -LO https://github.com/pulumi/pulumictl/releases/download/${PULUMICTL_VERSION}/pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz \
    && tar -C /usr/local/bin -xzf pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz \
    && rm pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz 

ENV ASDF_VERSION 0.11.2
ENV PATH=$PATH:/root/.asdf/shims
#https://github.com/dotnet/core/blob/main/Documentation/build-and-install-rhel6-prerequisites.md
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1

COPY .tool-versions /root/

RUN dnf install -y git unzip which make python3-pip \
    && pip3 install --upgrade pip setuptools \
    && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v${ASDF_VERSION} \
    && . $HOME/.asdf/asdf.sh \
    && asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git \
    && asdf plugin-add jq https://github.com/AZMCode/asdf-jq.git \
    && asdf plugin-add java https://github.com/halcyon/asdf-java.git \
    && asdf plugin-add golang https://github.com/kennyp/asdf-golang.git \
    && asdf plugin add golangci-lint https://github.com/hypnoglow/asdf-golangci-lint.git \
    && asdf plugin-add pulumi https://github.com/canha/asdf-pulumi.git \
    && asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git \
    && asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
    && asdf plugin-add yarn \
    && asdf install

