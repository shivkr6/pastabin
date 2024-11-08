FROM golang:1-alpine AS build

WORKDIR /app
COPY . .
RUN go build ./cmd/web/

FROM alpine:latest

WORKDIR /app
COPY ./ui /app/ui
COPY --from=build /app/web /app/web

EXPOSE 4000
ENTRYPOINT ["./web"]
