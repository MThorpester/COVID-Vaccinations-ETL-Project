DROP TABLE IF EXISTS vaccinations;

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

--SELECT COUNT(*) FROM state_vaccinations;
--SELECT DISTINCT(state_name) from vaccinations;
