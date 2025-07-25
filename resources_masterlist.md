# Healthcare Data Science Resources

A categorized collection of resources for processing healthcare data, tagged by language, use case, and efficacy.

## Resource Schema

- **Title**: Resource name with link
- **Type**: `Textbook` | `Course` | `Tutorial` | `Dataset`
- **Language**: Primary language(s)
- **Level**: `Beginner` | `Intermediate` | `Advanced`
- **Focus Areas**: `Data Cleaning` | `EHR Analysis` | `Clinical NLP` | `Claims Processing` | `Research Pipelines`
- **Efficacy**: ★☆☆ (Basic) to ★★★ (Comprehensive)
- **Notes**: Key features or limitations

---

## R-Centric Resources

### 1. [Health Data Science Using R](https://alicepaul.github.io/health-data-science-using-r/book)

- **Type**: Textbook
- **Language**: R
- **Level**: Intermediate
- **Focus Areas**: `EHR Analysis`, `Research Pipelines`
- **Efficacy**: ★★★ (End-to-end case studies)
- **Notes**: Covers tidyverse, bioconductor, and HIPAA-compliant workflows
  - had many case studies that show the step by step for coming up with the appropriate R script with visuals

### 2. [OHDSI Methods Library](https://github.com/OHDSI/StudyProtocols)

- **Type**: Tutorial
- **Language**: R, SQL
- **Level**: Advanced
- **Focus Areas**: `Claims Processing`, `Observational Research`
- **Efficacy**: ★★☆ (Specialized for OMOP CDM)

---

## Python-Centric Resources

### 1. [Clinical NLP with spaCy](https://course.spacy.io/en/)

- **Type**: Course
- **Language**: Python
- **Level**: Intermediate
- **Focus Areas**: `Clinical NLP`, `Data Cleaning`
- **Efficacy**: ★★☆ (Hands-on but narrow scope)

### 2. [PyHealth Tutorials](https://pyhealth.readthedocs.io/en/latest/tutorials.html)

- **Type**: Tutorial
- **Language**: Python
- **Level**: Advanced
- **Focus Areas**: `EHR Analysis`, `Deep Learning`
- **Notes**: Uses PyTorch for predictive modeling

### 3. [How to do Exploratory Data Analysis (EDA) of crime using python?](https://medium.datadriveninvestor.com/exploratory-data-analysis-of-crime-against-women-in-india-using-python-38a997753b7a)

### 4. [Exploring Descriptive Statistics Using Pandas and Seaborn](https://pub.towardsai.net/exploring-descriptive-statistics-using-pandas-and-seaborn-1b8501e1f27f)

[/Descriptive_Statistics.py](Python\Descriptive_Statistics.py)

### 5. [Dealing with Imbalanced Data: A Beginner&#39;s Guide](https://medium.com/@irfanalghani11/dealing-with-imbalanced-data-a-beginners-guide-262e6255a396)

### 6. [Pivot tables in Pandas and Handling Multi-Index Data with Hands-On Examples in Python](https://towardsdatascience.com/pivot-tables-in-pandas-with-hands-on-examples-in-python-9f29a48796f2)

### 7. [Compare Dependency of Categorical Variables with Chi-Square Test(Stat-12)](https://towardsdatascience.com/pivot-tables-in-pandas-with-hands-on-examples-in-python-9f29a48796f2)

---

## SQL-Centric Resources

### 1. [OMOP CDM SQL Cookbook](https://ohdsi.github.io/CommonDataModel/sqlScripts.html)

- **Type**: Tutorial
- **Language**: SQL
- **Level**: Intermediate
- **Focus Areas**: `Data Warehousing`, `Claims Processing`
- **Efficacy**: ★★☆ (OHDSI-specific)

### 2. [13 SQL Statements for 90% of Your Data Science Tasks](https://levelup.gitconnected.com/13-sql-statements-for-90-of-your-data-science-tasks-27902996dc2b)

- **Type**:
- **Language**:
- **Level**:
- **Focus Areas**:
- **Efficacy**:

---

## Multi-Language Resources

### 1. [MIMIC-III Critical Care Database](https://mimic.mit.edu/docs/iii/)

- **Type**: Dataset + Tutorials
- **Language**: R, Python, SQL
- **Level**: Advanced
- **Focus Areas**: `ICU Data`, `Time-Series Analysis`
- **Notes**: Includes Jupyter/R Markdown examples

### 2. [Data Analyst Bootcamp for Beginners](https://www.youtube.com/watch?v=PSNXoAs2FtQ&t) ✅ [COMPLETED]

- **Type**: Dataset + Tutorials
- **Language**: SQL, Tableau, Power BI, Python, Excel, Pandas, Projects
- **Level**: Beginner to Advanced
- **Focus Areas**: `SQL basics`, `dashboards`, `python web scraping`
- **Notes**: full walkthrough for a data analyst going straight through with one resource
  - \*\*Associated Git

---

## Language-Agnostic Resources

### 1. [HL7 FHIR Specification](https://www.hl7.org/fhir/)

- **Type**: Textbook
- **Language**: N/A (Standard)
- **Focus Areas**: `Data Modeling`, `Interoperability`
- **Efficacy**: ★☆☆ (Conceptual only)

### 2. [CMS Virtual Research Data Center Guide](https://resdac.org/)

- **Type**: Tutorial
- **Language**: N/A
- **Focus Areas**: `Medicare Claims`, `Regulatory Compliance`

---

## Filtering Guide

To subset resources:

- **By Language**: `grep -i "Language: R" README.md`
- **By Focus**: `grep "Focus Areas:.*NLP" README.md`
- **By Level**: `grep "Level: Intermediate" README.md`

_Last Updated: 2023-11-15 | [Contribute](https://github.com/yourrepo/healthcare-data-resources)_
