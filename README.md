# COVID-ETL-Project

This project extracts, transforms and loads COVID data from multiple sources into a Postgres Database. 

## Data Sources
- **COVID Vaccinations**: this data was extracted from the  "Our World in Data" site (https://ourworldindata.org/us-states-vaccinations). Several different files were downloaded containing state level vaccination metrics:
    - us-covid-number-fully-vaccinated-in-US.csv
    - us-covid-share-fully-vaccinated.csv
    - us-daily-covid-vaccine-doses-administered-by-state.csv
    - us-daily-covid-vaccine-doses-per-million.csv
- **COVID Cases and Deaths**: this data was extracted from the CDC's COVID Data Tracker at https://data.cdc.gov/Case-Surveillance/United-States-COVID-19-Cases-and-Deaths-by-State-o/9mfq-cb36. A single csv file containing both state level and national level case and death metrics was downloaded:
    - United_States_COVID_19_Cases_and_Deaths_by_State_over_Time.csv

## Data Transformation
- **COVID Vaccinations**: these data files were reduced to the required fields, combined, duplicates were removed, and then the state and national level data were split out separately. Of note:
    - the source data was duplicated across several Federal Agencies that individuals worked for and the states that those individuals lived in so I removed the duplicate data associated with the Federal Agencies.
    - the national and state counts don't always reconcile because of the way that the different jurisdictions report their data and how the CDC cross-checks and totals it up. I decided to preserve that difference.

- **COVID Cases and Deaths**: this data file was reduced to the required fields, augmented with state name to support joins with the vaccination data, and NYC metrics were added to the NY state totals and removed. Of note:
    - the vaccination data contains the state name, but the cases and deaths data contains the state abbreviation. I built a reference file to add the state name (and removed the state abbreviation) as I didn't want to have to create a junction table for this in the DB - it would unnecessarily complicate SQL queries.
    - Since the pandemic really blew up early on in New York City, the CDC tracked New York City and New York state metrics separately. So they were split out separately in the source file. I added the NYC counts into the NY state totals to create a table containing true state-level metrics, and removed the NYC data.

## Data Engineering
The transformed data is loaded into a PostgreSQL database. The database design and documentation can be viewed in:
- COVID-ETL/COVID_DB_ERD.png
- COVID-ETL/ERD-documentation.pdf  

The DB consists of 3 tables:
- state_vaccinations
- US_vaccinations
- state_cases_deaths

![COVID DB Entity Relationship Diagram ](https://github.com/MThorpester/COVID-Vaccinations-ETL-Project/blob/main/COVID-ETL/COVID_DB_ERD.png)


## Getting Started

Follow these steps to create this local COVID database on your machine.

### Prerequisites

You will need PostgreSQL, pgAdmin4, Python, Pandas, Psycopg, Jupyter Notebook and SQL Alchemy. 

### Steps to follow

1- Ensure all of the software listed above is installed on your machine<br>
2- Start up and/or connect to a local PostgreSQL server in pgAdmin, and create a new database called "COVID".
3- Run these SQL DDL commands from pgAdmin to create the empty database:
```
COVID-ETL/CovidDBSchema.sql
```
4- Run this Jupyter notebook to extract, transform and load the data to the database:

```
COVID-ETL/COVID-Data-ETL.ipnyb
```




