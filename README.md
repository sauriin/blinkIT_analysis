# 🛒 BlinkIT Grocery Data Analytics Project

![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![Python](https://img.shields.io/badge/Python-3.x-blue)
![PowerBI](https://img.shields.io/badge/PowerBI-Analytics-yellow)
![SQL](https://img.shields.io/badge/SQL-Database-green)

Transforming raw grocery sales data into meaningful business insights using Python, SQL, and Power BI.

---

## Project Overview

This project focuses on performing an end-to-end data analytics workflow on BlinkIT grocery sales data.

The project simulates a real-world business scenario where messy and inconsistent data is cleaned, validated, analyzed, and transformed into actionable insights for decision-making.

The goal is not only to build dashboards but also to think and work like a Data Analyst.

---

## Business Problem

Businesses generate huge amounts of raw data every day.

Without proper analysis, it becomes difficult to answer questions such as:

- Which products generate the highest sales?
- Which outlet performs best?
- How do product characteristics influence sales?
- Which categories contribute most to revenue?
- What patterns can help improve business decisions?

This project aims to answer these questions through data analytics.

---

## Project Goals

- Understand dataset structure
- Perform data cleaning
- Handle missing values
- Remove duplicate records
- Standardize inconsistent data
- Validate business logic
- Perform exploratory data analysis
- Create KPIs
- Build SQL queries
- Develop an interactive Power BI dashboard
- Generate business insights

---

## Current Progress

🔄 Current Phase:

```text
Phase 5: Feature Engineering
```

Completed Progress:

```text
Dataset Understanding      ✅
Data Profiling             ✅
Data Cleaning              ✅
EDA                         ✅
Feature Engineering         🔄
KPI Creation                ✅
SQL Analytics               ⏳
Power BI Dashboard          ⏳
Business Insights           ✅
Portfolio Optimization      ⏳
```

---

## Project Phases

### Phase 1: Dataset Understanding ✅

- Understand dataset structure
- Understand business context
- Identify columns and data types

### Phase 2: Data Profiling ✅

- Check dataset dimensions
- Identify missing values
- Detect duplicate records
- Investigate categorical values

### Phase 3: Data Cleaning & Validation ✅

- Handle missing values
- Remove duplicate records
- Standardize categories
- Validate business logic
- Detect outliers

### Phase 4: Exploratory Data Analysis ✅

- Product analysis
- Sales analysis
- Outlet analysis
- Correlation analysis
- KPI generation
- Business insights

### Phase 5: Feature Engineering 🔄

- Create useful analytical features
- Prepare data for deeper analysis

### Phase 6: SQL Analytics

- Business queries
- Aggregations
- Window functions
- Advanced analysis

### Phase 7: Power BI Dashboard

- KPI cards
- Interactive dashboard
- Slicers and filters
- Business visualizations

### Phase 8: Portfolio Optimization

- GitHub optimization
- Resume project description
- Interview preparation

---

## Tech Stack

### Programming & Analysis

- Python
- Pandas
- NumPy

### Visualization

- Matplotlib
- Seaborn
- Power BI

### Database

- SQL

---

## Project Structure

```text
blinkit_analysis
│
├── Dataset
│   ├── blinkit_dirty_dataset.csv
│   └── blinkit_cleaned_dataset.csv
│
├── Python
│   ├── data_cleaning.ipynb
│   ├── eda_analysis.ipynb
│   ├── feature_engineering.ipynb
│
├── SQL
│
├── PowerBI
│
├── Images
│
└── README.md
```

---

## Data Cleaning Completed

### Category Standardization

- LF → Low Fat
- low fat → Low Fat
- reg → Regular

### Missing Value Treatment

- Item_Weight → Median
- Item_MRP → Median
- Outlet_Size → Mode

### Duplicate Handling

- Removed duplicate records

### Business Logic Validation

- Removed negative sales values
- Removed unrealistic visibility values
- Removed invalid future establishment years

---

## Exploratory Data Analysis Completed

### Analysis Performed

- Sales distribution analysis
- Product category analysis
- Outlet analysis
- Correlation analysis
- Revenue contribution analysis
- Multivariate analysis
- KPI generation

### Key Findings

- Fruits and Vegetables generated the highest total sales.
- Supermarket Type1 contributed the highest total revenue.
- Supermarket Type3 showed the highest average sales.
- Tier 3 contributed the highest overall sales.
- Item MRP showed moderate positive correlation with sales.
- Outlet-related factors influenced sales more strongly than product-related factors.

---

## KPI Summary

| KPI | Value |
|------|--------|
| Total Sales | ₹18.55M |
| Average Sales | ₹2,182 |
| Average MRP | ₹140.98 |
| Total Products | 1559 |
| Total Outlets | 10 |

---

## Future Enhancements

- Sales forecasting
- Customer behavior analysis
- Advanced KPI dashboard
- Trend prediction
- Interactive business reporting

---

## Author

**Saurin Parmar**  
Aspiring Data Analyst | Python • SQL • Power BI