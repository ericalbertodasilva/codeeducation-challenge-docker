# 1 choose a compiler OS
FROM golang:alpine AS builder
# 2 (optional) label the compiler image
LABEL stage=builder
# 3 (optional) install any compiler-only dependencies
RUN apk add --no-cache gcc libc-dev
WORKDIR /go/src/app
COPY . .
# 5 build the GO program
RUN go build -o ./main .

EXPOSE 8080:8080

CMD ["main"]
