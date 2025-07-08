<!-- PROJECT LOGO -->

<br />
<div align="center">
  <a href="https://github.com/csanicola/important-reference-repo">
    <img src="Images/IMPORTANT REFERENCES REPOSITORY.png" alt="Logo">
  </a>

<h1 align="center">Caroline Sanicola's Important Reference Repository</h1>

<p align="center">
    For data analysis purposes specifically for healthcare data and publication purposes. 
    <br />
    Created and Maintained by Caroline Sanicola, M.S.
    <br />
    <a href="https://github.com/csanicola/important-reference-repo"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/csanicola/important-reference-repo">View Scripts</a>
    ·
    <a href="https://github.com/csanicola/important-reference-repo/issues">Report Issues</a>
    ·
    <a href="https://github.com/csanicola/important-reference-repo/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#purpose">Purpose</a></li>
        <li><a href="#key-features">Key Features</a></li>
        <li><a href="#disclaimer">Disclaimer</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#repository-structure">Repository Structure</a></li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#script-categories">Script Categories</a></li>
        <li><a href="#how-to-navigate">How to Navigate</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<!-- PURPOSE -->

### Purpose

This repository serves as a **centralized reference hub** for healthcare data science, providing:

- **Reusable scripts** for common analytical tasks (data cleaning, statistical modeling, visualization).
- **Tutorials** for healthcare-specific challenges (HIPAA compliance, EHR data wrangling).
- **Best practices** for reproducible research and publication-ready outputs.

<!-- KEY FEATURES -->

### Key Features

- 🏥 **Healthcare-Focused** : Examples tailored to clinical/epidemiological data.
- 📚 **Modular Design** : Scripts are organized by use case (e.g., "ICD-10 Coding", "Survival Analysis").
- 🔍 **Documented Workflows** : Jupyter/RMarkdown notebooks with step-by-step explanations.
- 🛡️ **Compliance-Aware** : Guidance on de-identification and HIPAA considerations.

<!-- DISCLAIMER -->

### Disclaimer

❗ **Important** :

- This repository contains **educational material only** .
- Scripts are provided **"as-is"** —users must validate outputs for clinical/research use.
- No PHI (Protected Health Information) is included; all examples use synthetic/dummy data.
- Consult your institution’s IRB and compliance office before applying to real-world data.

Use the `Readme.md` to get started.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

## Getting Started

### Prerequisites

| Tool/Language | Recommended Version | Installation Guide                             |
| ------------- | ------------------- | ---------------------------------------------- |
| Python        | 3.8+                | [python.org](https://www.python.org/downloads/)   |
| R             | 4.0+                | [cran.r-project.org](https://cran.r-project.org/) |
| Jupyter Lab   | 3.0+                | `pip install jupyterlab`                     |
| Git           | Latest              | [git-scm.com](https://git-scm.com/downloads)      |

### Installation

1. Clone the repo:

```bash
git clone https://github.com/csanicola/important-reference-repo.git
```

2. Install Python dependencies:

```bash
pip install -r requirements.txt # For Python users
```

3. For R users, install packages from install.packages.R:

```r
source("install_pacakges.R")
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Repository Structure

├── 📂 Data/ # Open sources and Fake Generated Healthcare Data for practice
│ ├── diabetes_012_health_indicators_BRFSS2015.csv
  |  ├── fake_healthcare_data.csv # Generated from fake_healthcare_data_practice.ipynb
│ └── sample_patient_data.csv
├── 📂 Data_Engineer_Pathway/
│ ├── 📂 1. Deepen Python Skills/
│ │ ├── I.Concepts.md
  |  │ └── II. Comprehension_Level.md
├── 📂 Guides/
│ ├── Data_Cleaning.md
│ ├── Data_Modeling_for_Scientific_Papers.md
│ ├── Exploratory_Data_Analysis\*(EDA).md
│ ├── Feature_Engineering.md
│ ├── Modeling.md
│ └── SQL.md
├── 📂 Healthcare_Data_Analysist_Learning_Path/
│ ├── 📂 01-Beginner/
│ │ ├── 📂 01-intro-to-programming/
│ │ │ ├── 📂 exercises/
│ │ │ │ ├── 📂 solutions/
│ │ │ │ │ ├── arithmetic_solution.py
│ │ │ │ │ ├── hello_world_solution.py
│ │ │ │ │ └── variables_solution.py
│ │ │ │ ├── exercise_1_hello_world.md
│ │ │ │ ├── exercise_2_variables.md
│ │ │ │ └── exercise_3_arithmetic.md
│ │ │ ├── basic_syntax.py
│ │ │ └── README.md
│ │ ├──📂 02-data-types-and-structures/
│ │ │ ├──📂 exercises/
│ │ │ ├── data_types.py
│ │ │ └── README.md
│ ├── 📂 02-Intermediate/
│ │ ├── 📂 01-oop/
│ │ │ ├── oop_basics.py
│ │ │ └── README.md
│ │ ├── 📂 02-intro-to-data-analysis/
│ │ │ ├── data_cleaning.py
│ │ │ └── README.md
│ ├── 📂 03-Advanced/
│ │ ├── 📂 01-machine-learning/
│ │ │ ├── ml_basics.py
│ │ │ └── README.md
│ │ ├── 📂 02-healthcare-specific-data-analysis/
│ │ │ ├── ehr_data_analysis.py
│ │ │ └── README.md
│ ├── 📂 Reference
│ │ │ ├── data_analysis_best_practices.md
│ │ │ ├── healthcare_data_standards.md
│ │ │ ├── python_cheatsheet.md
│ │ │ ├── reference_template.md
│ │ │ └── resources.md
│ │ └── README.md
├── 📂 Images
│ │ │ ├── boxplot.png
│ │ │ ├── correlation_matrix.png
│ │ │ ├── IMPORTANT REFERENCES REPOSITORY.png
│ │ │ ├── linear_regression.png
│ │ │ └── logistic_regression.png
├── 📂 Online_Courses

├── 📂 Practice

├── 📂 Projects

├── 📂 Python

├── 📂 R

├── 📂 SAS

├── 📂 SQL

├── 📂 Statistics
├── 🖼️ Data_Engineer_Pathway.png
├── 📜 requirements.txt # Python dependencies
├── 📜 install_packages.R # R dependencies
├── 📜 web_resources.md
└── 📜 LICENSE

<!-- USAGE -->

## Usage

1. Full guides for multiple courses covering various data science topics including college courses.

### Prerequisites

**Applications:**

- Visual Studio Code
- RStudio

**Languages:**

- Python
- R

### Installation

To install pandas, you can use the following command in your terminal:

```python
# !pip install pandas
```

Please note that you need to have Python and pip installed on your machine to run this command. The Python code provided in this project was developed with Python 3.8, but it should work with other versions of Python 3 as well.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DIRECTORY -->

## Directory

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Project Link: [https://github.com/csanicola/important-reference-repo](https://github.com/csanicola/important-reference-repo)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

<!-- MARKDOWN LINKS & IMAGES -->
