#!/bin/sh

VERSION="0.8.1"
PATCHES="https://st.suckless.org/patches/scrollback/st-scrollback-0.8.diff http://st.suckless.org/patches/clipboard/st-clipboard-0.8.1.diff"

docker run \
  -it \
  -w /tmp \
  -v "${HOME}/bin/:/output_bin_dir:Z" \
  -v "$(pwd)/st-patches:/st-patches:Z" \
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
    for f in /st-patches/*.diff; do patch -p1 < $f ; done && \
    make && \
    cp st /output_bin_dir/st_NEW'

echo "Built to ~/bin/st_NEW"
