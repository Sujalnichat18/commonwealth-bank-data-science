# Social Media Analytics – SQL Project Report

## 1. Project Objective

The objective of this project is to design a relational database and use SQL queries to analyse social media activity, user interactions and engagement metrics.

This project extends the database design concepts practised during the Commonwealth Bank Introduction to Data Science Virtual Job Simulation by Forage.

## 2. Tools and Technologies

- MySQL 8.0
- MySQL Workbench
- SQL

## 3. Database Design

Database: `social_media_analytics`

Four relational tables were created:

1. `users` – Stores user information.
2. `tweets` – Stores posts and engagement metrics.
3. `tweet_relationships` – Stores reply and quote relationships.
4. `tweet_mentions` – Stores public user mentions.

Primary keys and foreign keys were implemented to maintain referential integrity.

## 4. SQL Analysis Performed

The following analyses were implemented:

- Total engagement by user.
- Identification of users without posts.
- Average likes per post.
- Posts receiving above-average likes.
- Number of mentions per post.
- Identification of users with above-average followers.

## 5. SQL Concepts Applied

- SELECT and WHERE
- INNER JOIN and LEFT JOIN
- GROUP BY and ORDER BY
- COUNT(), SUM() and AVG()
- Subqueries
- NULL handling
- Primary and foreign keys

## 6. Business Applications

These queries demonstrate how social media data can support:

- Identifying highly engaged users.
- Understanding interaction patterns.
- Measuring post engagement.
- Finding users with no posting activity.
- Supporting social media reporting and analysis.

## 7. Limitations

- The database contains synthetic sample records.
- The dataset is small and intended for SQL practice.
- Results do not represent actual Commonwealth Bank social media activity.
- No predictive modelling or production deployment was performed.

## 8. Future Improvements

- Import a larger, properly sourced dataset.
- Perform advanced SQL analysis using window functions.
- Build a Power BI dashboard.
- Automate data ingestion and reporting.
- Add more detailed engagement metrics.

## 9. Project Outcome

This project provided practical experience in relational database design, SQL querying, data aggregation and analytical thinking.
