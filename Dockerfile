FROM ubuntu:14.04
MAINTAINER John Vivian <jtvivian@gmail.com>

RUN apt-get update && apt-get install --yes \
        curl \
        build-essential \
        git \
        python-pip \
        python-dev \
        zlib1g-dev \
        python-scipy \
        libhdf5-serial-dev && \
    pip install --upgrade pip && \
    pip install cython pysam h5py && \
    git clone https://github.com/ratschlab/spladder /opt/spladder && \
    chmod -R +x /opt/spladder && \
    curl -Lo /usr/local/bin/run_wrapper.py \
        https://raw.githubusercontent.com/gifford-lab/docker_signal_wrapper/master/run_wrapper.py && \
    chmod +x /usr/local/bin/run_wrapper.py

ENTRYPOINT [ "/usr/local/bin/run_wrapper.py" ]
