FROM ubuntu:16.04

# Install essentials for Icarus, Verilator, PyCocoTB, and CocoTB
# Add repos for GCC-6, G++-6, and Boost-1.67
RUN  apt-get update                                         && \
        apt-get install -y                                     \
        software-properties-common                          && \
        add-apt-repository -y "ppa:ubuntu-toolchain-r/test" && \
        add-apt-repository -y "ppa:mhier/libboost-latest"   && \
        apt-get install -y                                     \
        gcc-snapshot                                        && \
        apt-get update                                      && \
        apt-get full-upgrade -y

RUN apt-get install -y --no-install-recommends \
        autoconf                               \
        bison                                  \
        build-essential                        \
        cmake                                  \
        flex                                   \
        g++-6                                  \
        gcc-6                                  \
        git                                    \
        gperf                                  \
        gtkwave                                \
        libfl-dev                              \
        libxext6                               \
        libxft2                                \
        make                                   \
        python3-venv                           \
        python3-pip                            \
        python3-setuptools                     \
        python3.5                              \
        python3.5-dev                          \
        swig

RUN apt-get install -y   \
        libboost-all-dev \
        libboost-dev

RUN apt remove -y libboost1.58-dev

RUN apt-get install -y \
        boost1.67   && \
        rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && \
        pip install virtualenv

        # --no-install-suggests \

CMD ["/bin/bash"]
