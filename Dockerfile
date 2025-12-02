# -----------------------------------------------------------
# Dockerfile for 611 Final Project (Python + RStudio)
# Works on M1/M2 Mac + passes all class requirements
# -----------------------------------------------------------

# 1. Base image: RStudio server (Posit official)
FROM rocker/rstudio:latest

# 2. Install Python + required system tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# 3. Set working directory inside container
WORKDIR /project

# 4. Copy all project files into the image
COPY . /project

# 5. Create Python virtual environment + install Python packages
RUN python3 -m venv /project/venv \
    && /project/venv/bin/pip install --upgrade pip \
    && /project/venv/bin/pip install -r requirement.txt

# 6. Expose RStudio port
EXPOSE 8787

# 7. Set login env for RStudio
ENV USER=rstudio
ENV PASSWORD=rstudio

# 8. Start RStudio server
CMD ["/init"]



