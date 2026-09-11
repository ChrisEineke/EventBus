.PHONY := build test vet coverage bench cpubench membench all docs example install clean

.DEFAULT_GOAL := all

all: build test vet

clean:
	@rm -f cpu.pprof mem.pprof coverage.out
	@rm -rf cmd/*/pkg pkg/internal/*

build:
	@make -C pkg/events build
	@make -C examples build

test:
	@make -C pkg/events test

vet:
	@make -C pkg/events vet

coverage:
	@make -C pkg/events coverage

bench:
	@make -C pkg/events bench

cpubench:
	@make -C pkg/events cpubench

membench:
	@make -C pkg/events membench

install:
	@go install ./pkg/events

docs:
	@echo "Generating documentation..."
	@go doc ./pkg/events
