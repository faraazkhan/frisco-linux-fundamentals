# Lab: Capabilities

## Working with Docker and Capabilities

### Dropping capabilities for root user

Lets run an nginx container and bind to a privileged port, 80:

```
docker run -d --rm -p 80:80 nginx

```

This should just work, verify by running

```
curl localhost:80
```

To drop capabilities from the `root` account of a container

```
docker run --rm -p 80:80 --cap-drop NET_BIND_SERVICE nginx
```

Notice how you get an error saying "permission denied", can't bind to port 80.

### Drop all capabilities except what is needed

Lets drop all capabilities of the nginx image, except `CHOWN`

```
docker run --rm -it --cap-drop ALL --cap-add CHOWN nginx chown /etc/nginx
```

No errors here, this means we can change ownership of the /etc/nginx dir in the container

Now lets try to mount it on the 80 port again:

```
docker run --rm -it --cap-drop ALL --cap-add CHOWN -p 80:80 nginx
```

You should once again see an error, since the `NET_BIND_SERVICE` cap was dropped along with the others

```
docker run --rm -it --cap-add chown -u nobody alpine chown nobody /
```

also errors out because docker does not support cap add for non root users

