# Commonwealth Bank – Introduction to Data Science

**Virtual Job Simulation | Forage | November 2026**

## Overview

This repository documents my original learning notes and work from the Commonwealth Bank Introduction to Data Science virtual job simulation hosted on Forage. The simulation introduced four areas: transaction analysis, customer-data privacy, social-media analytics, and relational database design.

This was an educational virtual job simulation, not employment or an internship with Commonwealth Bank.

## Tasks completed

### 1. Data aggregation and analysis
- Explored supermarket transaction data and business questions.
- Practised data aggregation and summarisation using Excel.

### 2. Customer data anonymisation
- Examined why raw customer-level data can expose individual identities.
- Learned how generalising exact values into ranges can reduce privacy risk while retaining analytical usefulness.

### 3. Social media analytics
- Analysed a sample dataset of 60 posts using Excel PivotTables.
- Explored topic frequency, engagement, sentiment, customer intent, content format, and response requirements.
- Summarised descriptive findings to consider potential business actions.

### 4. Relational database design
- Proposed a relational schema for users, posts, replies, quote posts, and public mentions.
- Identified primary keys, foreign keys, and table relationships.
- Added an illustrative MySQL schema in `sql/social_media_schema.sql`.

## Selected findings from the practice dataset

| Measure | Finding |
|---|---:|
| Most frequent topic | Digital banking (13 posts) |
| Highest total engagement topic | Fraud & scams (36,283) |
| Positive sentiment | 25 posts |
| Neutral sentiment | 20 posts |
| Negative sentiment | 15 posts |
| Posts marked as requiring a response | 11 |
| Highest average engagement format | Text + video (5.13%) |

These are descriptive results from the 60-post simulated dataset only. They should not be interpreted as findings about Commonwealth Bank's actual social-media performance.

## Skills practised

- Microsoft Excel and PivotTables
- Data aggregation and exploratory analysis
- Data interpretation and business insights
- Social media engagement and sentiment analysis
- Data anonymisation and privacy concepts
- Relational database modelling
- Primary keys, foreign keys, and schema design

## Repository structure

- `docs/project-overview.md` – scope and workflow
- `docs/key-findings.md` – selected descriptive findings
- `docs/privacy-notes.md` – anonymisation concepts and limitations
- `sql/social_media_schema.sql` – original illustrative MySQL schema

## Next steps

- Implement and test the schema in MySQL.
- Write SQL queries for engagement and response prioritisation.
- Build a Power BI dashboard using an openly licensed or independently generated dataset.
- Extend the analysis with Python.

## Programme

[Commonwealth Bank – Introduction to Data Science on Forage](https://www.theforage.com/simulations/commonwealth-bank/intro-data-science-sd7t/completed)

---
*Completed as a Forage virtual job simulation in November 2026. This repository contains original notes and illustrative work; it does not redistribute programme datasets, instructions, or restricted materials.*
