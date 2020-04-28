# Bazarr Docker Image for Raspberry Pi [![Build Status](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-bazarr.svg?branch=master)](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-bazarr)

## Usage

```
docker run -d \
  --name bazarr \
  -v /path/to/config:/config \
  -v /path/to/data:/data \
  -p 6767:6767 \
  --restart unless-stopped \
  nelsonyaccuzzi/docker-rpi-bazarr
```
