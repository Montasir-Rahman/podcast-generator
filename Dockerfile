FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
 && rm -rf /var/lib/apt/lists/*

# Ensure python and pip are linked properly
RUN ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# Install PyYAML
RUN pip install --no-cache-dir PyYAML

# Copy your Python script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]