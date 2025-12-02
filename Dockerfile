FROM rocker/rstudio:latest

# Install system dependencies and Python
USER root
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Create project directory
RUN mkdir -p /project
WORKDIR /project

# Copy repo contents into the container
COPY . /project

# Create virtual environment, install dependencies, and build report.html at build time
RUN python3 -m venv /project/venv \
    && /project/venv/bin/pip install --no-cache-dir -r requirement.txt \
    && /project/venv/bin/jupyter nbconvert --to html 611final.ipynb --output report.html

# Give ownership of project files to the rstudio user
RUN chown -R rstudio:rstudio /project

# Switch to rstudio user for RStudio login
USER rstudio

# Expose RStudio port
EXPOSE 8787
ENV PASSWORD="rstudio"

CMD ["/init"]






