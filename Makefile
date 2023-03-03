
clean:
	rm -rf hugo/public/*

test:
	open http://localhost:1313
	hugox server -FD

test-preview:
	open http://localhost:1313
	hugox server -FD --config preview-config.toml

incident:
	mkdir content/incidents/$(slug)
	hugox new incidents/$(slug)/index.md

post:
	hugox new news/$(slug).md