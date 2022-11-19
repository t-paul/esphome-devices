#!/bin/bash

OP="$1"
DEV="$2"

YAML="$DEV".yaml

if [ x"$OP" != xwizard -a ! -f "$YAML" ]
then
	echo "Config file $YAML does not exist."
	exit 1
fi

OPTS=""
for SERIAL in /dev/ttyUSB*
do
	echo $SERIAL
	if [ -c "$SERIAL" ]
	then
		OPTS="$OPTS --device=$SERIAL"
	fi
done

echo "OPTS = $OPTS"
docker run --rm -v "${PWD}":/config $OPTS --network host -it esphome/esphome "$OP" "$YAML"
