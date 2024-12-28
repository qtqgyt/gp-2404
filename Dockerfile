FROM ubuntu:24.04

# Set non-interactive frontend for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    vim \
    build-essential \
    locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Set locale environment variables
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Add Gitpod group and user with the required GID and UID
RUN groupadd -g 33333 gitpod && \
    useradd -u 33333 -g 33333 -m gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER gitpod
WORKDIR /workspace
