#!/bin/bash

set -e

touch /var/log/puppetlabs/puppetserver/puppetserver.log
chmod 640 /var/log/puppetlabs/puppetserver/puppetserver.log
chown puppet:puppet /var/log/puppetlabs/puppetserver/puppetserver.log

XMS=$(echo $XMS | tr '[:upper:]' '[:lower:]')
XMX=$(echo $XMX | tr '[:upper:]' '[:lower:]')

sed -ri -e "s/\s?-XX:MaxPermSize=.*[^\"]//g" /etc/default/puppetserver

if [ ! -z "$XMS" ]
then
  sed -ri -e "s/(-Xms.*)\s/-Xms$XMS /g" /etc/default/puppetserver
fi

if [ ! -z "$XMX" ]
then
  sed -ri -e "s/(-Xmx.*)/-Xmx$XMX\"/g" /etc/default/puppetserver
fi

/opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true &>/dev/null &

# show logs on default console
exec /usr/bin/tail -f /var/log/puppetlabs/puppetserver/puppetserver.log