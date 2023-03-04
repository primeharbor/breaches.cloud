
# Note - HugoX is Hugo Extended version.
# This site is built with v 0.111.1
# https://github.com/gohugoio/hugo/releases/tag/v0.111.1
# Download and install for your architecture and place the binary in your path with the name hugox (
# so as not to conflict with base hugo)

clean:
	rm -rf hugo/public/*

test:
	open http://localhost:1313
	hugox server -F

test-preview:
	open http://localhost:1313
	hugox server -FD --config preview-config.toml

incident:
	mkdir content/incidents/$(slug)
	hugox new incidents/$(slug)/index.md

post:
	hugox new news/$(slug).md

main:
	hugox -F

preview:
	hugox -F --config preview-config.toml