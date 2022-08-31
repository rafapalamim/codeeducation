FROM golang:latest as builder
WORKDIR /go/src/hello
COPY hello.go .
RUN go env -w GO111MODULE=auto
RUN go build -o hello .
#CMD ["./hello"]

FROM scratch
WORKDIR /
COPY --from=builder /go/src/hello/hello .
ENTRYPOINT [ "./hello" ]