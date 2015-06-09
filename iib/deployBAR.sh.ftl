#!/bin/bash

echo "Starting deployment of ${deployed.file} on ${deployed.container.name}."
source /home/vagrant/iib-10.0.0.0/server/bin/mqsiprofile

BEFORE=$(mqsilist ${deployed.container.integrationNodeName} -e ${deployed.container.integrationServerName}|grep -v Successful|awk -F":" '{ print "["$2"]" }'|sed 's/\[ /\[/g')
mqsideploy ${deployed.container.integrationNodeName} -e ${deployed.container.integrationServerName} -a ${deployed.file}
AFTER=$(mqsilist ${deployed.container.integrationNodeName} -e ${deployed.container.integrationServerName}|grep -v Successful|awk -F":" '{ print "["$2"]" }'|sed 's/\[ /\[/g')

echo "BEFORE: ${r"${BEFORE}"}"
echo "AFTER : ${r"${AFTER}"}"

exit $?
