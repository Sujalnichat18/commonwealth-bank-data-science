# Data privacy and anonymisation notes

## Why anonymise?

Customer-level data may contain direct identifiers or combinations of attributes that make an individual identifiable. Sharing raw records can expose personal information and create privacy and security risks.

## Generalisation into ranges

One approach is to replace exact values with broader categories, for example:

- Exact age -> age bands (such as 18–24, 25–34, 35–44)
- Exact income -> income bands
- Exact location -> a broader geographic area, where appropriate

This is often called generalisation or bucketing. It can reduce the precision of personal information while retaining some analytical value.

## Other safeguards to consider

- Remove direct identifiers that are not needed for the analysis.
- Limit access and share only the minimum necessary fields.
- Aggregate results where record-level detail is unnecessary.
- Assess re-identification risk, including combinations of quasi-identifiers.
- Apply retention, access-control, and governance policies.

Anonymisation is not guaranteed merely by removing names. Small groups and combinations of attributes can still enable re-identification. The appropriate method depends on the data, purpose, and risk assessment.
