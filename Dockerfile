# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest 
# gcr.io/distroless/static:nonroot

ARG TARGETOS TARGETARCH

ADD out/${TARGETOS:-linux}_${TARGETARCH:-amd64}/manager /manager
ADD resources /var/lib/istio-operator/resources

USER 65532:65532
WORKDIR /
ENTRYPOINT ["/manager"]
