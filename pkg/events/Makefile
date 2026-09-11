build:
	@go build

test: build
	@gotestsum -f standard-verbose -- -race -coverprofile=coverage.out

vet:
	@go vet ./...

coverage: build
	@go tool cover -html=coverage.out

bench: test
	@go test -bench . -benchtime 3s

cpubench: test
	@go test -bench . -benchtime 3s -cpuprofile=cpu.pprof

membench: test
	@go test -bench . -benchtime 3s -memprofile=mem.pprof
