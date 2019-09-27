VERSION = $(shell git describe --dirty --tags --always)

SERVICES = shoppinglist_command shoppinglist_query


all: build run

build:
		git submodule update --remote
		$(foreach service,$(SERVICES),make -C ./$(service) build; docker build -t $(service) ./$(service);)
		
run:	
		docker-compose up