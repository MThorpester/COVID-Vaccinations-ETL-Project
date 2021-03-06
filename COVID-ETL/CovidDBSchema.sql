DROP TABLE IF EXISTS state_vaccinations;
DROP TABLE IF EXISTS US_vaccinations;
DROP TABLE IF EXISTS state_cases_deaths;

CREATE TABLE state_vaccinations (
	state_name VARCHAR(35),
	date_administered DATE,
	people_fully_vaccinated INTEGER,
	people_fully_vaccinated_per_hundred NUMERIC(5,2),
	daily_vaccinations INTEGER,
	daily_vaccinations_per_million INTEGER,
	
	PRIMARY KEY(date_administered,state_name)
);

CREATE TABLE US_vaccinations (
	date_administered DATE,
	people_fully_vaccinated INTEGER,
	people_fully_vaccinated_per_hundred NUMERIC(5,2),
	daily_vaccinations INTEGER,
	daily_vaccinations_per_million INTEGER,
	PRIMARY KEY(date_administered)
);

CREATE TABLE state_cases_deaths (
	submission_date DATE,
	state_name VARCHAR(35),
	tot_cases INTEGER,
	new_cases INTEGER,
	tot_deaths INTEGER,
	new_deaths INTEGER,
	PRIMARY KEY(submission_date, state_name)
);

-- These Queries can be run To verify that tables have been properly populated after running ETL process:
-- SELECT * FROM state_vaccinations LIMIT 100;
-- SELECT DISTINCT(state_name) from state_vaccinations;
-- SELECT COUNT(*) FROM US_vaccinations;
-- SELECT DISTINCT(date_administered) from US_vaccinations;
-- SELECT * FROM US_vaccinations;
-- SELECT * FROM state_cases_deaths LIMIT 100;
-- SELECT DISTINCT(state_name) from state_cases_deaths;
