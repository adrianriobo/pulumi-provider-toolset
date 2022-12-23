# pulumi-provider-toolset

oci image with toolset required for build pulumi providers

## Overview

This repository creates an oci image to be used as dev environment for pulumi providers. It could be integrated as a Makefile target
to build the code without rely on installing all required dependecies, or it could be used on a CI/CD environemnt.

![oci build](https://github.com/adrianriobo/pulumi-provider-toolset/actions/workflows/build-oci.yaml/badge.svg)
[![registry](https://quay.io/repository/ariobolo/pulumi-provider-toolset/status "Container Repository on Quay")](https://quay.io/repository/ariobolo/pulumi-provider-toolset)
