#!/bin/bash

source /app/compose/django/entrypoint.sh
export HOME=/home/django
env > /tmp/environment
cp /tmp/environment /home/django/.ssh/environment

cat /app/compose/debug/welcome_msg

/usr/sbin/sshd -D