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

### 3. [Clinical NLP with spaCy](https://course.spacy.io/en/)

- **Type**: Course
- **Language**: Python
- **Level**: Intermediate
- **Focus Areas**: `Clinical NLP`, `Data Cleaning`
- **Efficacy**: ★★☆ (Hands-on but narrow scope)

### 4. [PyHealth Tutorials](https://pyhealth.readthedocs.io/en/latest/tutorials.html)

- **Type**: Tutorial
- **Language**: Python
- **Level**: Advanced
- **Focus Areas**: `EHR Analysis`, `Deep Learning`
- **Notes**: Uses PyTorch for predictive modeling

---

## SQL-Centric Resources

### 5. [OMOP CDM SQL Cookbook](https://ohdsi.github.io/CommonDataModel/sqlScripts.html)

- **Type**: Tutorial
- **Language**: SQL
- **Level**: Intermediate
- **Focus Areas**: `Data Warehousing`, `Claims Processing`
- **Efficacy**: ★★☆ (OHDSI-specific)

---

## Multi-Language Resources

### 6. [MIMIC-III Critical Care Database](https://mimic.mit.edu/docs/iii/)

- **Type**: Dataset + Tutorials
- **Language**: R, Python, SQL
- **Level**: Advanced
- **Focus Areas**: `ICU Data`, `Time-Series Analysis`
- **Notes**: Includes Jupyter/R Markdown examples

---

## Language-Agnostic Resources

### 7. [HL7 FHIR Specification](https://www.hl7.org/fhir/)

- **Type**: Textbook
- **Language**: N/A (Standard)
- **Focus Areas**: `Data Modeling`, `Interoperability`
- **Efficacy**: ★☆☆ (Conceptual only)

### 8. [CMS Virtual Research Data Center Guide](https://resdac.org/)

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
