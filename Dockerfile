FROM golang:1.12.0 AS build-env
WORKDIR /usr/local/go/src/github.com/dotmesh-io/gitlab-runner-mon
COPY . /usr/local/go/src/github.com/dotmesh-io/gitlab-runner-mon
RUN make install

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build-env /usr/local/go/bin/gitlabrunnercheck /bin/gitlabrunnercheck
CMD ["/bin/gitlabrunnercheck"]