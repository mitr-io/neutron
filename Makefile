all: build
start:
	go run neutron.go
build:
	go build -o neutron neutron.go
build-client:
	cd public && \
	sed -i 's/"angular"\: "1.4.9"/"angular": "~1.4.9"/g' bower.json && \
	npm install && \
	sed -i 's/https:\/\/dev\.protonmail\.com//g' src/app/config.js && \
	node_modules/.bin/grunt build
clean-client-dist:
	rm -rf public/node_modules public/test
