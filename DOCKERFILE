# Use the official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables
ENV container docker

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND noninteractive

# Install systemd and other necessary packages
RUN apt-get update && \
    apt-get install -y systemd systemd-sysv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the systemd service unit for Docker
COPY docker-entrypoint.sh /usr/local/bin/

# Set the entrypoint to the custom script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Default command
CMD ["/bin/bash"]

# Expose necessary ports (adjust as
