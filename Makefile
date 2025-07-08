# Simple Makefile for Go CLI tool

BINARY_NAME=go-greeter-user

# Build the binary
build:
	go build -o $(BINARY_NAME) main.go

# Install globally
install:
	go install

# Clean
clean:
	rm -f $(BINARY_NAME)

# Run
run:
	go run main.go

.PHONY: build install clean run