FROM docker.io/library/eclipse-temurin:8u352-b08-jdk

ENV GO_VERSION 1.19.4
ENV GOCI_LINT_VERSION 1.50.1
ENV JQ_VERSION 1.50.1
ENV PULUMICTL_VERSION v0.0.32
ENV PULUMI_VERSION v3.50.2
ENV GRADLE_VERSION 7.6
ENV NODE_VERSION v18.12.1

ENV PATH ${PATH}:/usr/local/go/bin:/usr/local/dotnet:/usr/local/pulumi:/usr/local/gradle-${GRADLE_VERSION}/bin:/usr/local/node-${NODE_VERSION}-linux-x64/bin
#https://github.com/dotnet/core/blob/main/Documentation/build-and-install-rhel6-prerequisites.md
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1

RUN apt-get update \
    && apt-get install -y unzip python3 python3-pip \
    && curl -LO https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz \
    && curl -LO https://github.com/golangci/golangci-lint/releases/download/v${GOCI_LINT_VERSION}/golangci-lint-${GOCI_LINT_VERSION}-linux-386.tar.gz \
    && tar -C /usr/local/bin --strip-components 1 -xzf golangci-lint-${GOCI_LINT_VERSION}-linux-386.tar.gz \
    && rm golangci-lint-${GOCI_LINT_VERSION}-linux-386.tar.gz \
    && curl -L https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -o /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq \
    && curl -LO https://github.com/pulumi/pulumictl/releases/download/${PULUMICTL_VERSION}/pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz \
    && tar -C /usr/local/bin -xzf pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz \
    && rm pulumictl-${PULUMICTL_VERSION}-linux-amd64.tar.gz \
    && curl -LO https://download.visualstudio.microsoft.com/download/pr/7fe73a07-575d-4cb4-b2d3-c23d89e5085f/d8b2b7e1c0ed99c1144638d907c6d152/dotnet-sdk-7.0.101-linux-x64.tar.gz \
    && mkdir -p /usr/local/dotnet \
    && tar -C /usr/local/dotnet -xzf dotnet-sdk-7.0.101-linux-x64.tar.gz \
    && rm dotnet-sdk-7.0.101-linux-x64.tar.gz \
    && curl -LO https://github.com/pulumi/pulumi/releases/download/${PULUMI_VERSION}/pulumi-${PULUMI_VERSION}-linux-x64.tar.gz \
    && tar -C /usr/local -xzf pulumi-${PULUMI_VERSION}-linux-x64.tar.gz \
    && rm pulumi-${PULUMI_VERSION}-linux-x64.tar.gz \
    && curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /usr/local \
    && rm gradle-${GRADLE_VERSION}-bin.zip \
    && curl -LO https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz \
    && tar -C /usr/local -xf node-${NODE_VERSION}-linux-x64.tar.xz \
    && rm node-${NODE_VERSION}-linux-x64.tar.xz \
    && npm install --global yarn
