FROM pandoc/ubuntu-crossref:2.16.2
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get --yes update && \
    apt-get --no-install-recommends --yes install \
        librsvg2-bin  texlive-xetex lmodern \
        texlive-fonts-recommended texlive-fonts-extra && \
    rm -rf /var/lib/apt/lists/*
