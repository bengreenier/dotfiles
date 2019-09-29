# Docker Desktop

+ Install from [Docker Hub](https://hub.docker.com/?overlay=onboarding)
+ Non-standard Configuration (so, default, if not listed below):
```
General:
    Start on login: Yes
    Automatically check for updates: Yes
Shared Drives:
    C: Yes
Advanced:
    CPUs: 4
    Memory: 6400 MB
    Swap: 2048 MB
    Disk Image Location: Default
    Disk Image Max Size: 96 GB
```

## Dev container

Create the container in which everything gets done. Other parts of the dev setup will reference this image by name.

```
docker build -t bengreenier/dotfile-devcontainer:latest -f dev-container.Dockerfile .
```

Expects the following volume mounts at runtime:
```
/home/bengreenier/.ssh: Ssh key directory from host
/home/bengreenier/git: Source directory from host
/mnt/session_store: A location at which session data can be persisted (bash_history, etc)

# and, for docker inside docker
//var/run/docker.sock:/var/run/docker.sock
```
