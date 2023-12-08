FROM registry.betsys.com/dockerhub/library/golang:1.21-alpine

WORKDIR /app

COPY go.mod go.sum ./
COPY main.go main.go

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o ./bin/k8intro
RUN adduser -D -s /bin/sh -u 241 appuser
USER appuser

EXPOSE 8090

CMD ["./bin/k8intro"]