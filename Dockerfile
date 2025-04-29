FROM alpine:latest AS builder

RUN apk update && apk add --no-cache go

WORKDIR /app

COPY main.go .

RUN go mod init desafioGO

RUN go build -ldflags="-s -w" -o app .

FROM scratch

COPY --from=builder /app/app /app

CMD ["/app"]