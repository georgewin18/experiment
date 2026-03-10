FROM golang:1.21-alpine as builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
ENV PORT=8080
EXPOSE 8080
CMD ["./main"]