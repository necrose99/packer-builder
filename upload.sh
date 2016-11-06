#!/bin/bash
NAME=$1
FILE=$2

if [ -z "${NAME}" ] || [ "${NAME}" == "--help" ] || [ -z "${FILE}" ]; then
  echo "Usage: $0 machine jobname"
  echo "$0 p1 windows_2016_docker_vmware"
  exit 1
fi

today=$(date +%Y-%m-%d)
cat <<CMD | ssh root@$(./packet.sh ip $NAME)
$(pass azure-vagrantboxes)
azure storage blob list box
echo azure storage blob upload packer-windows/${FILE}.box box ${FILE}/$today/${FILE}.box
CMD
