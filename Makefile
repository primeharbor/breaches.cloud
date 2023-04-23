
# Note - HugoX is Hugo Extended version.
# This site is built with v 0.111.1
# https://github.com/gohugoio/hugo/releases/tag/v0.111.1
# Download and install for your architecture and place the binary in your path with the name hugox (
# so as not to conflict with base hugo)

PORT=1315


clean:
	rm -rf hugo/public/*

test:
	open http://localhost:$(PORT)
	hugox server -F -p $(PORT)

test-preview:
	open http://localhost:$(PORT)
	hugox server -FD --config preview-config.toml -p $(PORT)

incident:
	mkdir content/incidents/$(name)
	hugox new incidents/$(name)/index.md

post:
	hugox new news/$(name).md

# Create Using the main config, all current and future posts, but nothing in draft
main:
	hugox -F

# Create Using the preview config, all current and future posts, both published & in draft
preview:
	hugox -FD --config preview-config.toml

force-build:
	git commit -m "Force Build" --allow-empty && git push