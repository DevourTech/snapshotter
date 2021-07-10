FROM golang:1.16

#ENV GOPATH=/go

RUN mkdir -p /go/src/github.com/devourtech/app
ADD . /go/src/github.com/devourtech/app

#RUN export GOPATH=/go && \
#    cd /go/src/github.com/devourtech/app && \
#    go build -o ./cmd/snappy ./cmd/main.go && \
#    chmod 777 ./cmd/snappy

RUN chmod +x /go/src/github.com/devourtech/app/entrypoint.sh

ENTRYPOINT ["/go/src/github.com/devourtech/app/entrypoint.sh"]