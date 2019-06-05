FROM ubuntu:16.04

RUN  apt-get update && \
     apt-get install -y --no-install-recommends \
     python \
     perl \
     libxft2 \
     libxext6 \
     ksh \
     && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
