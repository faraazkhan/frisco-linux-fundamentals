# Docker Cgroups

Run

```
docker run --help | grep cpu
```
to see all options available for cpu management.

Similarly

```
docker run --help | grep memory
docker run --help | grep blk
```
Lets see this in action, lets build a stress container:

```
cat <<EOF> Dockerfile.stress

FROM ubuntu:latest
RUN apt-get update -y \
    && apt-get install -y stress

CMD stress -c 2
EOF
```

### CPU Set (CPU Affinity)

Now lets build this container and run it:

```
docker build -t stress -f Dockerfile.stress .
docker run -d --name stressboth stress
```
Let's monitor the cpu usage using htop:

```
sudo yum install htop -y
htop
```

Notice we are now using two cores on the host, lets see how we can limit this to just one core next:

```
docker rm -f stressboth
docker run -d --name stressone --cpuset-cpus 0 stress
htopA
docker rm -f stressboth
```

Using cpuset-cpus we can limit a container to a subnet of cores identified by their index example: 0, 0-2, 0,4


### CPU Time Share

Lets run two containers of our stress container, but limit them to a single core and only allow a total of 50% time on the machines

```
docker run --rm -d --name stress1 --cpuset-cpus 0 --cpu-shares 256 stress
docker run --rm -d --name stress2 --cpuset-cpus 0 --cpu-shared 256 stress
htop
docker rm -f stress1 stress2
```

### Process Limiting

Let's start a pid limited container, with:

```
docker run --rm -it --pids-limit 200 ubuntu bash
:(){ :|: & };: ## This is a fork bomb, try at your own risk
htop
```
