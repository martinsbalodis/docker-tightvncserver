# docker-tightvncserver

An X11 server that runs inside a docker container and can be used by other 
docker containers. Was made for github actions as a service container that 
would provide x11 as a service.

Thanks to Jürgen Weigert for providing a sharable .Xauthority configuration. 
https://stackoverflow.com/a/25280523/271733

## building
```bash
docker build --no-cache --tag=martinsbalodis/docker-tightvncserver .
docker push martinsbalodis/docker-tightvncserver
```

## testing
```bash
docker-compose up
```
