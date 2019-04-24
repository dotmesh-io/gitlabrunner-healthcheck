LDFLAGS		+= -s -w

test:
	go get github.com/mfridman/tparse	
	go test -json  -v `go list ./... | egrep -v /tests/` -cover | tparse -all -smallscreen

install:
	cd cmd/gitlabrunnercheck && CGO_ENABLED=0 GOOS=linux go install -ldflags "$(LDFLAGS)"

run: install
	gitlabrunnercheck 