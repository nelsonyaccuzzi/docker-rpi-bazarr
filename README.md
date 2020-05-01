# Bazarr Docker Image for Raspberry Pi 
![Travis (.org)](https://img.shields.io/travis/nelsonyaccuzzi/docker-rpi-bazarr?style=flat-square)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/nelsonyaccuzzi/docker-rpi-bazarr?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/nelsonyaccuzzi/docker-rpi-bazarr?style=flat-square)


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
