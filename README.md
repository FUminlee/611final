
# 611 Final Project — Diabetes Classification Analysis

This project analyzes the **Diabetes_012 Health Indicators (BRFSS 2015)** dataset using
machine learning techniques. We explore two binary classification tasks and compare the performance of **Logistic Regression** and **Random Forest** models.

The entire project follows the structure required in the assignment rubric:
- Docker containerization  
- Makefile workflow  
- Reproducible environment  
- Jupyter-based analysis  

---

## Overview

The dataset contains 22 health-related features collected from BRFSS 2015.
We construct two binary prediction tasks based on the `Diabetes_012` variable:

### **Task A: 0 vs (1+2)**
- 0 = No diabetes  
- 1 or 2 = Prediabetes or Diabetes  
- Goal: detect early or full diabetes

### **Task B: (0+1) vs 2**
- 0 & 1 = No diabetes or prediabetes  
- 2 = Diabetes  
- Goal: predict full diabetes

We train two models:
- **Logistic Regression**
- **Random Forest**

Models are evaluated using:
- ROC AUC  
- PR AUC (AUPRC)  
- Precision  
- ROC curves  
- PR curves  
- Bar plots comparing metrics  

All figures and code exist in the `611final.ipynb` file.

---


## Implementation Details

To run this project, first download the dataset from:
https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset

After downloading, update the data-loading path inside the 611final.ipynb notebook so it correctly points to your local dataset location.

And then you can try to bulid the docker through the following guidance:

1. Build the Docker image:

    docker build -t 611final-rstudio .

2. Run the Docker container:

    docker run --rm \
      -p 8787:8787 \
      -e PASSWORD=rstudio \
      --user root \
      611final-rstudio

3. Open RStudio in your browser:

    http://localhost:8787

    Username: rstudio
    Password: rstudio

4. Enter the project directory:

    cd /project

5. Generate the HTML report:

A pre-generated report.html will be included when you try to bulid docker.  
If you want to regenerate it:

    rm report.html
    make

This will create a new report.html using nbconvert.
