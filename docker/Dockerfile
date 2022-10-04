FROM ros:noetic

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
    sudo \
    locales \ 
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

# Set env variables
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    XVFB_WHD="1920x1080x24"\
    LIBGL_ALWAYS_SOFTWARE="1"

ENV ROS_DISTRO="noetic"
ARG USERNAME
ARG UUID
ARG UGID

RUN useradd -m $USERNAME && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod --uid $UUID $USERNAME && \
    groupmod --gid $UGID $USERNAME

# install utils packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    bash-completion \
    build-essential \
    git \
    vim \
    wget \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

# install ros additional packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    ros-noetic-roscpp-tutorials \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

# setup entrypoint
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
