FROM golang:alpine3.17 AS build
WORKDIR /
COPY . .
RUN go get github.com/go-delve/delve/cmd/dlv
RUN go install github.com/go-delve/delve/cmd/dlv
RUN go build -gcflags "all=-N -l" -o ./app

FROM scratch
COPY --from=build /go/bin/dlv /dlv
COPY --from=build /app /app
ENTRYPOINT [ "/dlv" ]