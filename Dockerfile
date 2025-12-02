FROM rocker/rstudio:latest

# Install system utilities and Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /project

# Copy project files
COPY . /project

# Make sure rstudio user owns the files
RUN chown -R rstudio:rstudio /project

# Create Python virtual environment + install requirements
RUN python3 -m venv /project/venv \
    && /project/venv/bin/pip install --no-cache-dir -r requirement.txt

EXPOSE 8787

ENV USER=rstudio
ENV PASSWORD=rstudio

CMD ["/init"]




