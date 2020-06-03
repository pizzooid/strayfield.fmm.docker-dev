FROM quay.io/fenicsproject/stable:current

USER root
WORKDIR /tmp

RUN sudo apt-get update -y && sudo apt-get install -y swig gdb valgrind && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG USERNAME=fenics
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME

USER fenics

RUN echo "alias python=python3" >> ~/.bashrc 