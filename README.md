# dotfiles

My devenv things.

## Getting started

Install these:

+ [VS Code](https://code.visualstudio.com)
+ [Git](https://git-scm.com/download)
+ [Docker](https://hub.docker.com/?overlay=onboarding)
+ Windows Terminal


Then:

```
git clone --recursive git@github.com:bengreenier/dotfiles.git
cd docker
docker build -t bengreenier/dotfile-devcontainer:latest -f dev-container.Dockerfile .
```

And finally, copy `windows_terminal/profiles.json` over the default (or merge em).
