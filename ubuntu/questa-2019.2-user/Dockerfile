FROM ycradarcy/ubuntu-16.04:questa-2019.2-install

# To override from CLI:
#  --build-arg USER=<user-name>
ARG USER
ENV USER ${USER:-questa_user}

# Create a user account with the same UID as in the parent
RUN useradd -m -U $USER
        apt-get install -y --no-install-recommends \

# After RUN command so RUN executes as root, container executes as USER
USER $USER

CMD ["/bin/bash"]
