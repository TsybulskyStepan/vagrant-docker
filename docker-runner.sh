DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -n $2 ]
then
	cd ${DIR}/dockerVM
	if [ $1 = 'ssh' ]
	then
		vagrant ssh docker
	elif [ $1 = 'down' ]
	then
		truncate -s 0 ${DIR}/dockerVM/running
		vagrant halt
	elif [ $1 = 'up' ]
	then
		docker_path=$2 vagrant up --provision
	elif [ $1 = 'reload' ]
	then
		docker_path=$2 vagrant reload --provision
	fi
fi