FROM golang:1.17 as builder

WORKDIR /go/src/argo-cd-demo

COPY ./ ./

ENV CGO_ENABLED=0 

RUN go build -o main .


FROM scratch

COPY --from=builder /go/src/argo-cd-demo/main ./

ENTRYPOINT [ "./main" ]
