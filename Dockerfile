FROM debian:stable
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Pre-reqs
RUN apt update && \
    apt install --no-install-recommends -y python3-paho-mqtt python3-pip python3-setuptools && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install dhooks

# Copy files into place
COPY mqtt2discord /

# Set the entrypoint
ENTRYPOINT ["/mqtt2discord"]
