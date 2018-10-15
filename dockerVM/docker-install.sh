#!/usr/bin/env bash

if [ "$(docker -v | awk '{print $3}' | tr -d ',')" = "18.06.1-ce" ]
then
	echo Docker installed and configured
else
	apt-get remove -y docker docker-engine docker.io
	apt-get update && apt-get install --allow-unauthenticated -y apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update && apt-get install --allow-unauthenticated -y docker-ce jq
	usermod -aG docker vagrant
	usermod -aG docker ubuntu
	curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.19.0/docker-compose-$(uname -s)-$(uname -m)"
	chmod +x /usr/local/bin/docker-compose
	docker-compose -v
fi