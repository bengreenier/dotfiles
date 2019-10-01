# A pinned ubuntu version (probably check for updates if you're running this)
FROM ubuntu:bionic-20190912.1

# Install basics
RUN apt-get update && apt-get install -y \
    git ssh curl sudo openssl dos2unix tmux \
    apt-transport-https ca-certificates software-properties-common language-pack-en \
    python3-dev python3-pip python3-setuptools

# Install thefuck
RUN pip3 install thefuck

# Install gg
RUN curl -fsSL git.io/gg.sh | bash

# Install docker cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce-cli

# Add a user (and allow sudo, without password)
RUN useradd -r bengreenier -G audio,video,sudo,tty,dialout \
    && mkdir -p /home/bengreenier \
    && chown -R bengreenier /home/bengreenier \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers \
    && usermod --shell /bin/bash bengreenier

# Install bash_profile
COPY .bash_profile /home/bengreenier
RUN dos2unix /home/bengreenier/.bash_profile

# Install tmux config
COPY ./dot-tmux/.tmux.conf /home/bengreenier
COPY ./.tmux.conf.local /home/bengreenier
RUN dos2unix /home/bengreenier/.tmux.conf /home/bengreenier/.tmux.conf.local

# Become the user
USER bengreenier
WORKDIR /home/bengreenier
RUN touch ~/.sudo_as_admin_successful
ENTRYPOINT [ "/bin/bash", "--login", "-c", "tmux" ]
