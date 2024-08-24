# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

get-repos: 				## Chapter 2.7 - Clones/Pull all necessary repositories
	./c8sm-course/2/2.7-get-repos.sh

tooling-config: 	## Chapter 2.8 - Adds helm repos & updates dependencies
	./c8sm-course/2/2.8-tooling-config.sh

start-minikube: 	## Chapter 6.1 - Starts Minikube Cluster
	./c8sm-course/6/6.1-start-minikube.sh

stop-minikube: 		## Chapter 6.1 - Stops Minikube Cluster
	./c8sm-course/6/6.1-stop-minikube.sh

delete-minikube: 	## Chapter 6.1 - Deletes Minikube Cluster
	./c8sm-course/6/6.1-delete-minikube.sh

check-dns: 				## Chapter 7.1 - Sanity check as prerequisite for working ingresses
	./c8sm-course/7/7.1-check-dns.sh

install-c8: 			## Chapter 7.2 - Installs C8SM via helm
	./c8sm-course/7/7.2-install-c8.sh

cleanup-c8:				## Chapter 7.3 - Cleanup healthy installation
	./c8sm-course/7/7.3-cleanup.sh


aio: 							## Install c8sm including all prerequisites
	$(MAKE) check-dns
	$(MAKE) get-repos
	$(MAKE) tooling-config
	$(MAKE) start-minikube
	$(MAKE) install-c8

reinstall-c8:			## Chapter 8.1 - Reinstall with unhealthy values (values.yaml required)
	./c8sm-course/8/8.1-reinstall-c8.sh
