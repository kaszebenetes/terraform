# https://usrme.xyz/posts/how-to-trim-a-container-image-that-includes-azure-cli/

FROM debian:11

RUN apt-get update \
&& apt-get --no-install-recommends -y install python3-pip \
&& pip3 install --no-cache-dir --no-dependencies azure-cli \
&& pip3 install --no-cache-dir azure-cli-core azure-common azure-mgmt-resource colorama semver \
&& apt-get remove -y python3-pip \
&& apt-get --no-install-recommends install python3-minimal libpython3.9-stdlib \
&& apt-get clean autoclean \
&& apt-get autoremove --yes \
&& rm -rf /var/lib/{apt,dpkg,cache,log}/

# recommends
# ca-certificates libexpat1 libgpm2 libmpdec3 libncursesw6 libpython3.9-minimal libpython3.9-stdlib libreadline8 libsqlite3-0 media-types openssl python3-minimal python3.9 python3.9-minimal readline-common

# no recommends
# libexpat1 libpython3.9-minimal python3-minimal python3.9-minimal

# apt-get --no-install-recommends install python3-pip
# ca-certificates libexpat1 libmpdec3 libncursesw6 libpython3-stdlib libpython3.9-minimal libpython3.9-stdlib libreadline8 libsqlite3-0 media-types openssl python-pip-whl python3 python3-distutils python3-lib2to3 python3-minimal python3-pip python3-pkg-resources python3-setuptools python3-wheel python3.9 python3.9-minimal readline-common

# apt-get --no-install-recommends install python3-minimal libpython3.9-stdlib

# pip3 install colorama semver
