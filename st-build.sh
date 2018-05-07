#!/bin/sh

VERSION="0.8.1"
PATCHES="https://st.suckless.org/patches/scrollback/st-scrollback-0.8.diff"

docker run \
  -it \
  -w /tmp \
  -v "${HOME}/bin/:/output_bin_dir:Z" \
  --rm \
  -e VERSION="${VERSION}" \
  -e PATCHES="${PATCHES}" \
  gcc \
  bash -x -c '\
    apt-get update && \
    apt-get install -y libxft-dev && \
    wget https://dl.suckless.org/st/st-${VERSION}.tar.gz && \
    tar zxvf st-${VERSION}.tar.gz && \
    cd st-${VERSION} && \
    for p in ${PATCHES}; do wget $p && patch -p1 < ${p##*/} ; done && \
    make && \
    cp st /output_bin_dir/'

