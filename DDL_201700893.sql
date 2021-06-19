DROP DATABASE IF EXISTS practicaMIA;
CREATE DATABASE practicaMIA;
USE practicaMIA;
--0 Creacion de la tabla Temporal
DROP TABLE IF EXISTS Temporal;
CREATE TABLE Temporal(
	id_temporal INT NOT NULL IDENTITY(1,1),
	iso_code VARCHAR(255),
	continent VARCHAR(255),
	location VARCHAR(255),
	date VARCHAR(255),
	total_cases VARCHAR(255),
	new_cases VARCHAR(255),
	new_cases_smoothed VARCHAR(255),
	total_deaths VARCHAR(255),
	new_deaths VARCHAR(255),
	new_deaths_smoothed VARCHAR(255),
	total_cases_per_million VARCHAR(255),
	new_cases_per_million VARCHAR(255),
	new_cases_smoothed_per_million VARCHAR(255),
	total_deaths_per_million VARCHAR(255),
	new_deaths_per_million VARCHAR(255),
	new_deaths_smoothed_per_million VARCHAR(255),
	reproduction_rate VARCHAR(255),
	icu_patients VARCHAR(255),
	icu_patients_per_million VARCHAR(255),
	hosp_patients VARCHAR(255),
	hosp_patients_per_million VARCHAR(255),
	weekly_icu_admissions VARCHAR(255),
	weekly_icu_admissions_per_million VARCHAR(255),
	weekly_hosp_admissions VARCHAR(255),
	weekly_hosp_admissions_per_million VARCHAR(255),
	new_tests VARCHAR(255),
	total_tests VARCHAR(255),
	total_tests_per_thousand VARCHAR(255),
	new_tests_per_thousand VARCHAR(255),
	new_tests_smoothed VARCHAR(255),
	new_tests_smoothed_per_thousand VARCHAR(255),
	positive_rate VARCHAR(255),
	tests_per_case VARCHAR(255),
	tests_units VARCHAR(255),
	total_vaccinations VARCHAR(255),
	people_vaccinated VARCHAR(255),
	people_fully_vaccinated VARCHAR(255),
	new_vaccinations VARCHAR(255),
	new_vaccinations_smoothed VARCHAR(255),
	total_vaccinations_per_hundred VARCHAR(255),
	people_vaccinated_per_hundred VARCHAR(255),
	people_fully_vaccinated_per_hundred VARCHAR(255),
	new_vaccinations_smoothed_per_million VARCHAR(255),
	stringency_index VARCHAR(255),
	population VARCHAR(255),
	population_density VARCHAR(255),
	median_age VARCHAR(255),
	aged_65_older VARCHAR(255),
	aged_70_older VARCHAR(255),
	gdp_per_capita VARCHAR(255),
	extreme_poverty VARCHAR(255),
	cardiovasc_death_rate VARCHAR(255),
	diabetes_prevalence VARCHAR(255),
	female_smokers VARCHAR(255),
	male_smokers VARCHAR(255),
	handwashing_facilities VARCHAR(255),
	hospital_beds_per_thousand VARCHAR(255),
	life_expectancy VARCHAR(255),
	human_development_index VARCHAR(255),
	excess_mortality VARCHAR(255),
	PRIMARY KEY (id_temporal)
);
--Ya 1 Creacion de tabla Continente
DROP TABLE IF EXISTS Continente;
CREATE TABLE Continente(
	id_continente INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(255),
	PRIMARY KEY (id_continente)
);
--Ya 2 Creacion de tabla Fecha
DROP TABLE IF EXISTS Fecha;
CREATE TABLE Fecha(
	id_fecha INT NOT NULL IDENTITY(1,1),
	fecha DATE,
	PRIMARY KEY (id_fecha)
);
--Ya 3 Creacion de tabla Pais
DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais(
	id_pais INT NOT NULL IDENTITY(1,1),
	id_continente INT NOT NULL,
	iso_code VARCHAR(255),
	nombre VARCHAR(255),
	population BIGINT,
	population_density DECIMAL,
	median_age DECIMAL,
	aged_65_older DECIMAL,
	aged_70_older DECIMAL,
	gdp_per_capita DECIMAL,
	extreme_poverty DECIMAL,
	diabetes_prevalence DECIMAL,
	female_smokers DECIMAL,
	male_smokers DECIMAL,
	handwashing_facilities DECIMAL,
	life_expectancy DECIMAL,
	human_development_index DECIMAL,
	excess_mortality DECIMAL,
	PRIMARY KEY (id_pais),
	CONSTRAINT fk_id_continente 
		FOREIGN KEY (id_continente) 
		REFERENCES Continente (id_continente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 4 Creacion de tabla Casos
DROP TABLE IF EXISTS Casos;
CREATE TABLE Casos(
	id_casos INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	total_cases BIGINT,
	new_cases BIGINT,
	new_cases_smoothed FLOAT,
	total_cases_per_million FLOAT,
	new_cases_per_million FLOAT,
	new_cases_smoothed_per_million FLOAT,
	PRIMARY KEY (id_casos),
	CONSTRAINT fk_id_pais_casos
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_casos
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 5 Creacion de tabla Muertes
DROP TABLE IF EXISTS Muertes;
CREATE TABLE Muertes(
	id_muertes INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	total_deaths BIGINT,
	new_deaths BIGINT,
	new_deaths_smoothed FLOAT,
	total_deaths_per_million FLOAT,
	new_deaths_per_million FLOAT,
	new_deaths_smoothed_per_million FLOAT,
	PRIMARY KEY (id_muertes),
	CONSTRAINT fk_id_pais_muertes
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_muertes
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 6 Creacion de tabla Rates
DROP TABLE IF EXISTS Rates;
CREATE TABLE Rates(
	id_rates INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	reproduction_rate FLOAT,
	positive_rate FLOAT,
	cardiovasc_death_rate FLOAT,
	PRIMARY KEY (id_rates),
	CONSTRAINT fk_id_pais_rates
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_rates
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 7 Creacion de tabla Icu
DROP TABLE IF EXISTS Icu;
CREATE TABLE Icu(
	id_icu INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	icu_patients BIGINT,
	icu_patients_per_million FLOAT,
	weekly_icu_admissions FLOAT,
	weekly_icu_admissions_per_million FLOAT,
	PRIMARY KEY (id_icu),
	CONSTRAINT fk_id_pais_icu
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_icu
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 8 Creacion de tabla HospitalInfo
DROP TABLE IF EXISTS HospitalInfo;
CREATE TABLE HospitalInfo(
	id_hospital_info INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	hosp_patients BIGINT,
	hosp_patients_per_million FLOAT,
	weekly_hosp_admissions FLOAT,
	weekly_hosp_admissions_per_million FLOAT,
	hospital_beds_per_thousand FLOAT,
	PRIMARY KEY (id_hospital_info),
	CONSTRAINT fk_id_pais_hospital_info
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_hospital_info
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--Ya 9 Creacion de tabla Test
DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
	id_test INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	new_tests BIGINT,
	total_tests BIGINT,
	total_tests_per_thousand FLOAT,
	new_tests_per_thousand FLOAT,
	new_tests_smoothed FLOAT,
	new_tests_smoothed_per_thousand FLOAT,
	tests_per_case FLOAT,
	tests_units VARCHAR(255),
	PRIMARY KEY (id_test),
	CONSTRAINT fk_id_pais_test
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_test
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--10 Creacion de tabla Vacuna
DROP TABLE IF EXISTS Vacuna;
CREATE TABLE Vacuna(
	id_vacuna INT NOT NULL IDENTITY(1,1),
	id_pais INT NOT NULL,
	id_fecha INT NOT NULL,
	total_vaccinations BIGINT,
	people_vaccinated BIGINT,
	people_fully_vaccinated BIGINT,
	new_vaccinations BIGINT,
	new_vaccinations_smoothed FLOAT,
	total_vaccinations_per_hundred FLOAT,
	people_vaccinated_per_hundred FLOAT,
	people_fully_vaccinated_per_hundred FLOAT,
	new_vaccinations_smoothed_per_million FLOAT,
	stringency_index FLOAT,
	PRIMARY KEY (id_vacuna),
	CONSTRAINT fk_id_pais_vacuna
		FOREIGN KEY (id_pais)
		REFERENCES Pais (id_pais)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_id_fecha_vacuna
		FOREIGN KEY (id_fecha)
		REFERENCES Fecha (id_fecha)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
--8:09 min