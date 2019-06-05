FROM ycradarcy/ubuntu-16.04:pre-verilator-icarus-py-cocotb

COPY ./verilator_patches_tmp verilator_patches_tmp/

# Check out and install the latest Icarus version 10
RUN git clone -q https://github.com/steveicarus/iverilog.git && \
        git config --global user.email "fake@example.com"    && \
        git config --global user.name  "fake name"           && \
        cd iverilog                                          && \
        git checkout v10-branch                              && \
        sh autoconf.sh                                       && \
        ./configure                                          && \
        make                                                 && \
        make install                                         && \
        cd /

# Check out Pycocotb, install Verilator in it, and apply patches
# Got hash and other goodies from passing pycocotb/.travis.yml
#  https://travis-ci.org/Nic30/pycocotb/jobs/522576920#L406
RUN git clone -q https://github.com/Nic30/pycocotb.git        && \
        cd pycocotb                                           && \
        git clone -q http://git.veripool.org/git/verilator    && \
        unset VERILATOR_ROOT                                  && \
        cd verilator                                          && \
        git checkout 47107a5a36e9562144ec13d4f7821942cf767b21 && \
        git checkout .                                        && \
        git am ../verilator_patches_tmp/*.patch               && \
        autoconf                                              && \
        ./configure                                           && \
        CPPFLAGS=-std=c++11 make                              && \
        make install                                          && \
        cd /

# Install CocoTB
RUN git clone -q https://github.com/potentialventures/cocotb.git && \
        pip install ./cocotb

# Install PyCocoTB and Python3.5 virtual environment
RUN cd pycocotb                                 && \
        virtualenv -p /usr/bin/python3.5 venv   && \
        /bin/bash -c "source venv/bin/activate" && \
        which python && python --version        && \
        which pip    && pip    --version        && \
        pip list                                && \
        pip install coveralls pytest            && \
        pip install -U setuptools               && \
        pip list

# Note:- Docker does not recognize the VENV
#        So use /usr/bin/python3 not ./venv/bin/python
RUN cd pycocotb                                 && \
        virtualenv -p /usr/bin/python3.5 venv   && \
        /bin/bash -c "source venv/bin/activate" && \
        pip list                                && \
        which python && python --version        && \
        which pip    && pip    --version        && \
        MATRIX_EVAL="CC=gcc-6 && CXX=g++-6"     && \
        eval "${MATRIX_EVAL}"                   && \
        venv/bin/python setup.py install

ENV PATH="/usr/local/bin:${PATH}"

CMD ["/bin/bash"]
