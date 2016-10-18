# About this Repo

This image runs the LATEST Puppet Server from Puppet Collections.

# How to use this image

## Preparations

Let's create necessary directories:

```
mkdir -p /opt/puppetlabs/logs/puppetserver
mkdir -p /opt/puppetlabs/code
```


Choose target directories of your choice.

## Environment

Control memory settings of your JVM with "-e XMS" and/or "-e XMX".

## Startup

```
docker run \
  -d \
  --name puppetserver \
  -e XMS="2g" \
  -e XMX="2g" \
  -p 8140:8140 \
  -v /opt/puppetlabs/logs:/var/log/puppetlabs \
  -v /opt/puppetlabs/code:/etc/puppetlabs/code \
  mminks/docker-puppetserver
```


You can skip "-e XMS" and/or "-e XMX" if defaults are fine for you.

# Contribution

I welcome any kind of contribution. Fork it or contact me. I appreciate any kind of help.
