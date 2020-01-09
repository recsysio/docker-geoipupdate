# Build stage
FROM golang:alpine as build

ENV GO111MODULE=on
ARG VERSION=v4.0.3
ARG WORKDIR=/go/src/github.com/maxmind/geoipupdate

RUN apk add --update --no-cache git

RUN git clone --branch ${VERSION} https://github.com/maxmind/geoipupdate.git ${WORKDIR}
WORKDIR ${WORKDIR}
RUN go get -u github.com/maxmind/geoipupdate/cmd/geoipupdate
RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -a -installsuffix cgo -o /geoipupdate ./cmd/geoipupdate

# Release stage
FROM alpine:latest

COPY --from=build /geoipupdate /usr/local/bin
COPY /entrypoint.sh /usr/local/bin

RUN mkdir -p /data/db
VOLUME /data/db

ENTRYPOINT ["entrypoint.sh"]
