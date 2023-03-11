FROM golang:latest as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

WORKDIR /

COPY --from=builder /usr/local/bin/app /usr/local/bin/

CMD ["app"]