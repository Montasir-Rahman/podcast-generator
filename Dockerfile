FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Python, PyYAML, and Git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-yaml \
    git \
 && rm -rf /var/lib/apt/lists/*

# Link python and pip
RUN ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# Copy script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]