FROM ubuntu:22.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools and Node.js repository
RUN apt-get update && apt-get install -y \
	curl \
	git \
	vim \
	net-tools \
	iproute2 \
	iputils-ping \
	ripgrep \
	ca-certificates \
	gnupg \
	sshpass \
	&& mkdir -p /etc/apt/keyrings \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Install Node.js 22
RUN apt-get update && apt-get install -y nodejs

# Install GitHub Copilot CLI
RUN npm install -g @github/copilot

ENV COPILOT_HOME=/root/.copilot
ENV COPILOT_ALLOW_ALL=true

# OPTIONAL: Install any other dependencies your devleopment setup
# might require (Python, Java, etc.)

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default command: bash
CMD ["/bin/bash"]
