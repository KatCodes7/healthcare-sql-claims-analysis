# Healthcare Claims SQL Analysis

SQL-based analysis of healthcare claims data to identify trends in utilization, reimbursement patterns, and population demographics.

---

## Overview

This project analyzes Medicare beneficiary data using SQL to identify age-related reimbursement trends, chronic condition impact, and patterns in healthcare utilization.

---

## Population Distribution by Age Group

The dataset is heavily concentrated in older populations, with over 88% of beneficiaries classified as “Old” or “Very Old.” This aligns with Medicare’s target demographic and indicates that observed utilization and cost patterns are primarily driven by age-related healthcare needs.

---

## Healthcare Cost Trends by Age Group

Inpatient reimbursement shows a clear upward trend with age, peaking in the “Very Old” group, which suggests increased reliance on intensive healthcare services in later life stages.

In contrast, outpatient reimbursement remains relatively consistent across age groups, indicating that routine care utilization is stable, while cost escalation is primarily driven by inpatient services.

This pattern highlights inpatient care as a key driver of cost growth in aging populations.

---

## Chronic Condition Impact on Reimbursement

Beneficiaries with diabetes incurred substantially higher healthcare costs compared to those without diabetes, with average inpatient reimbursement (4870.62) more than double that of non-diabetic patients (1830.82).

A similar trend is observed in outpatient reimbursement, indicating consistently higher utilization across care settings.

These findings suggest that diabetes is a key driver of healthcare cost escalation and highlight the importance of targeted chronic condition management strategies to reduce long-term healthcare expenditure.

---

## High-Cost Beneficiary Patterns

High-cost utilization was concentrated largely among beneficiaries in the “Old” and “Very Old” age groups, with the top records showing total reimbursement amounts between $171,190 and $262,720.

These results suggest that a relatively small subset of beneficiaries accounts for a disproportionate share of healthcare spending, reinforcing the importance of identifying high-cost populations for targeted intervention, care coordination, and cost-containment efforts.

---

## Business Impact

This analysis demonstrates how SQL can be used to transform raw healthcare data into actionable operational insights.

Potential business applications include:

- Identifying age groups associated with higher inpatient cost burden  
- Highlighting chronic condition populations that may require proactive care management  
- Supporting resource planning by revealing utilization patterns across beneficiary groups  
- Enabling healthcare organizations to focus cost-containment strategies on high-impact segments  

These insights support more informed decision-making in utilization management, care coordination, and cost reduction initiatives.

---

## Dashboard

An interactive dashboard was created in Google Sheets to visualize key insights from the dataset, including age distribution, healthcare cost trends, and the impact of chronic conditions.

[View Interactive Dashboard](https://docs.google.com/spreadsheets/d/112zTg3MeRmX77Tkv7OCb7gLkWNcYsch_6_Ustr1eruI/edit?usp=sharing)

---

## Dashboard Preview


## Project Structure

```
healthcare-claims-sql-analysis/
├── data/
│   └── ProviderFraud.csv
├── sql/
│   └── healthcare_sql_analysis.sql
└── README.md
```

---

## How to Run This Project

1. Open SQLite  
2. Import the dataset using `.mode csv` and `.import`  
3. Run the SQL script located in `/sql/healthcare_sql_analysis.sql`  
4. Execute analysis queries to reproduce insights  

---

## Tools Used

- SQLite  
- SQL  

---

## Skills Demonstrated

- Data cleaning and transformation  
- Type casting and data standardization  
- Aggregation and grouping  
- Conditional logic using CASE statements  
- Healthcare data analysis and insight generation  

---

## Summary

This project demonstrates an end-to-end workflow of importing, cleaning, analyzing, and extracting actionable insights from healthcare data using SQL.

---

## Future Improvements

- Extend analysis to additional chronic conditions  
- Incorporate time-based trends if longitudinal data is available  
- Build a dashboard (Excel or Power BI) for visualization and reporting  
