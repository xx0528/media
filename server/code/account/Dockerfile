FROM alpine:latest

WORKDIR /app

COPY ./cmd/cmd /app/cmd
COPY ./configs /app/configs

CMD ["./cmd", "--conf", "configs"]