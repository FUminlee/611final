FROM rocker/rstudio:latest

# Use root to install system packages
USER root

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Create project directory with correct ownership FIRST
RUN mkdir -p /project
RUN chown -R rstudio:rstudio /project

WORKDIR /project

# Copy repo contents AND set owner to rstudio
COPY --chown=rstudio:rstudio . /project

# Switch to rstudio user
USER rstudio

# Create virtual environment inside project
RUN python3 -m venv /project/venv

# Install dependencies inside venv
RUN /project/venv/bin/pip install --no-cache-dir -r requirement.txt

# Expose RStudio port
EXPOSE 8787

ENV PASSWORD="rstudio"

CMD ["/init"]





