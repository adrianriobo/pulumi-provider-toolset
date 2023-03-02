VERSION ?= 3.55.0
CONTAINER_MANAGER ?= podman
# Image URL to use all building/pushing image targets
IMG ?= quay.io/ariobolo/pulumi-provider-toolset:v${VERSION}

# Build the container image
.PHONY: oci-build
oci-build: 
	${CONTAINER_MANAGER} build -t ${IMG} -f Containerfile .

# Push the container image
.PHONY: oci-push
oci-push:
	${CONTAINER_MANAGER} push ${IMG}
	
