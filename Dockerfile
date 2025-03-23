FROM docker.io/library/ubuntu:latest

RUN apt-get update && apt-get -y install build-essential cmake curl git pkgconf libreadline8 libusb-0.1 libgpgme11 \
    libarchive-tools libz-dev fakeroot python3 p7zip python3-venv

WORKDIR /opt/pspdev
RUN curl -L https://github.com/pspdev/pspdev/releases/latest/download/pspdev-ubuntu-latest-x86_64.tar.gz | tar -zxvf - -C /usr/local/

ENV PSPDEV=/usr/local/pspdev
ENV PATH=$PATH:$PSPDEV/bin

RUN python3 -m venv /opt/python-venv
ENV PATH="/opt/python-venv/bin:$PATH"
RUN pip install ecdsa pycryptodome

RUN git clone https://github.com/swarzesherz/sign_np/ /opt/sign_np
WORKDIR /opt/sign_np
RUN make
RUN mv sign_np $PSPDEV/bin

WORKDIR /opt/mkpsxiso
RUN curl -LO https://github.com/Lameguy64/mkpsxiso/releases/download/v2.10/mkpsxiso-2.10-Linux.deb
RUN apt install ./mkpsxiso-2.10-Linux.deb

WORKDIR /source
RUN rm -rf /opt/pspdev /opt/mkpsxiso /opt/sign_np