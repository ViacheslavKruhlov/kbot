APP = $(shell basename $(shell git remote get-url origin))
REGISTRY = viacheslavkruhlov
VERSION = $(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS ?= linux # linux windows darwin
TARGETARCH ?= arm64 # amd64 arm64

ppp:
	echo ${TARGETOS}

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: get format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="github.com/ViacheslavKruhlov/prometheus-devops/module2/kbot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
