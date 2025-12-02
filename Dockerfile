# Use Posit's official M1/M2-compatible base image (required by class)
FROM rocker/rstudio:latest

# Install system utilities and Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /project

# Copy your project files into the container
COPY . /project

# Install Python packages
RUN pip3 install --no-cache-dir -r requirement.txt

# Expose RStudio default port
EXPOSE 8787

# Environment variables required for RStudio to run inside Docker
ENV USER=rstudio
ENV PASSWORD=rstudio

# Default command when the container starts
CMD ["/init"]
