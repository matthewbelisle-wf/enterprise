# run from docker terminal. Search "docker" in Alfred
build:
	docker build -t codecov/enterprise .

runi:
	docker run -t -i -p 5000:5000 \
			   -v /Users/peak/Documents/codecov/codecov.yml:/codecov.yml \
			   codecov/enterprise bash

run:
	docker run -t -p 5000:5000 \
			   -v /Users/peak/Documents/codecov/codecov.yml:/codecov.yml \
			   codecov/enterprise

kill:
	docker kill $(shell docker ps | tail -1 | cut -d' ' -f1)
