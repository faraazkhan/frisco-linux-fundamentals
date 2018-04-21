# Deploying a simple UI to the Docker Registry

A docker registry UI can be useful if you want to:

* List all your repositories/images
* List tags for your repositories/images
* Share URLs to a certain image
* Display image metadata like size


# Simple to start

Delete the current running registries

```
docker rm -f registry
```

Then run:

```
docker run -d --privileged -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer
```


Then navigate to `10.1.0.4:9000` from your host

To learn more about the portainer project, see: https://portainer.io/
