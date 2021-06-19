--Procedimiento para recorrer todos los registros de la tabla temporal
CREATE PROCEDURE recorridoTemporal
	AS
	DECLARE @iso_code VARCHAR(255);
	DECLARE @continent VARCHAR(255);
	DECLARE @location VARCHAR(255);
	DECLARE @date VARCHAR(255);
	DECLARE @total_cases VARCHAR(255);
	DECLARE @new_cases VARCHAR(255);
	DECLARE @new_cases_smoothed VARCHAR(255);
	DECLARE @total_deaths VARCHAR(255);
	DECLARE @new_deaths VARCHAR(255);
	DECLARE @new_deaths_smoothed VARCHAR(255);
	DECLARE @total_cases_per_million VARCHAR(255);
	DECLARE @new_cases_per_million VARCHAR(255);
	DECLARE @new_cases_smoothed_per_million VARCHAR(255);
	DECLARE @total_deaths_per_million VARCHAR(255);
	DECLARE @new_deaths_per_million VARCHAR(255);
	DECLARE @new_deaths_smoothed_per_million VARCHAR(255);
	DECLARE @reproduction_rate VARCHAR(255);
	DECLARE @icu_patients VARCHAR(255);
	DECLARE @icu_patients_per_million VARCHAR(255);
	DECLARE @hosp_patients VARCHAR(255);
	DECLARE @hosp_patients_per_million VARCHAR(255);
	DECLARE @weekly_icu_admissions VARCHAR(255);
	DECLARE @weekly_icu_admissions_per_million VARCHAR(255);
	DECLARE @weekly_hosp_admissions VARCHAR(255);
	DECLARE @weekly_hosp_admissions_per_million VARCHAR(255);
	DECLARE @new_tests VARCHAR(255);
	DECLARE @total_tests VARCHAR(255);
	DECLARE @total_tests_per_thousand VARCHAR(255);
	DECLARE @new_tests_per_thousand VARCHAR(255);
	DECLARE @new_tests_smoothed VARCHAR(255);
	DECLARE @new_tests_smoothed_per_thousand VARCHAR(255);
	DECLARE @positive_rate VARCHAR(255);
	DECLARE @tests_per_case VARCHAR(255);
	DECLARE @tests_units VARCHAR(255);
	DECLARE @total_vaccinations VARCHAR(255);
	DECLARE @people_vaccinated VARCHAR(255);
	DECLARE @people_fully_vaccinated VARCHAR(255);
	DECLARE @new_vaccinations VARCHAR(255);
	DECLARE @new_vaccinations_smoothed VARCHAR(255);
	DECLARE @total_vaccinations_per_hundred VARCHAR(255);
	DECLARE @people_vaccinated_per_hundred VARCHAR(255);
	DECLARE @people_fully_vaccinated_per_hundred VARCHAR(255);
	DECLARE @new_vaccinations_smoothed_per_million VARCHAR(255);
	DECLARE @stringency_index VARCHAR(255);
	DECLARE @population VARCHAR(255);
	DECLARE @population_density VARCHAR(255);
	DECLARE @median_age VARCHAR(255);
	DECLARE @aged_65_older VARCHAR(255);
	DECLARE @aged_70_older VARCHAR(255);
	DECLARE @gdp_per_capita VARCHAR(255);
	DECLARE @extreme_poverty VARCHAR(255);
	DECLARE @cardiovasc_death_rate VARCHAR(255);
	DECLARE @diabetes_prevalence VARCHAR(255);
	DECLARE @female_smokers VARCHAR(255);
	DECLARE @male_smokers VARCHAR(255);
	DECLARE @handwashing_facilities VARCHAR(255);
	DECLARE @hospital_beds_per_thousand VARCHAR(255);
	DECLARE @life_expectancy VARCHAR(255);
	DECLARE @human_development_index VARCHAR(255);
	DECLARE @excess_mortality VARCHAR(255);
	DECLARE @iterador INT;
	SET @iso_code = NULL;
	SET @continent = NULL;
	SET @location = NULL;
	SET @date = NULL;
	SET @total_cases = NULL;
	SET @new_cases = NULL;
	SET @new_cases_smoothed = NULL;
	SET @total_deaths = NULL;
	SET @new_deaths = NULL;
	SET @new_deaths_smoothed = NULL;
	SET @total_cases_per_million = NULL;
	SET @new_cases_per_million = NULL;
	SET @new_cases_smoothed_per_million = NULL;
	SET @total_deaths_per_million = NULL;
	SET @new_deaths_per_million = NULL;
	SET @new_deaths_smoothed_per_million = NULL;
	SET @reproduction_rate = NULL;
	SET @icu_patients = NULL;
	SET @icu_patients_per_million = NULL;
	SET @hosp_patients = NULL;
	SET @hosp_patients_per_million = NULL;
	SET @weekly_icu_admissions = NULL;
	SET @weekly_icu_admissions_per_million = NULL;
	SET @weekly_hosp_admissions = NULL;
	SET @weekly_hosp_admissions_per_million = NULL;
	SET @new_tests = NULL;
	SET @total_tests = NULL;
	SET @total_tests_per_thousand = NULL;
	SET @new_tests_per_thousand = NULL;
	SET @new_tests_smoothed = NULL;
	SET @new_tests_smoothed_per_thousand = NULL;
	SET @positive_rate = NULL;
	SET @tests_per_case = NULL;
	SET @tests_units = NULL;
	SET @total_vaccinations = NULL;
	SET @people_vaccinated = NULL;
	SET @people_fully_vaccinated = NULL;
	SET @new_vaccinations = NULL;
	SET @new_vaccinations_smoothed = NULL;
	SET @total_vaccinations_per_hundred = NULL;
	SET @people_vaccinated_per_hundred = NULL;
	SET @people_fully_vaccinated_per_hundred = NULL;
	SET @new_vaccinations_smoothed_per_million = NULL;
	SET @stringency_index = NULL;
	SET @population = NULL;
	SET @population_density = NULL;
	SET @median_age = NULL;
	SET @aged_65_older = NULL;
	SET @aged_70_older = NULL;
	SET @gdp_per_capita = NULL;
	SET @extreme_poverty = NULL;
	SET @cardiovasc_death_rate = NULL;
	SET @diabetes_prevalence = NULL;
	SET @female_smokers = NULL;
	SET @male_smokers = NULL;
	SET @handwashing_facilities = NULL;
	SET @hospital_beds_per_thousand = NULL;
	SET @life_expectancy = NULL;
	SET @human_development_index = NULL;
	SET @excess_mortality = NULL;
	SET @iterador = 1;
	
	WHILE @iterador <= 95743
	BEGIN
		SELECT
			@iso_code = iso_code,
			@continent = continent,
			@location = location,
			@date = date,
			@total_cases = total_cases,
			@new_cases = new_cases,
			@new_cases_smoothed = new_cases_smoothed,
			@total_deaths = total_deaths,
			@new_deaths = new_deaths,
			@new_deaths_smoothed = new_deaths_smoothed,
			@total_cases_per_million = total_cases_per_million,
			@new_cases_per_million = new_cases_per_million,
			@new_cases_smoothed_per_million = new_cases_smoothed_per_million,
			@total_deaths_per_million = total_deaths_per_million,
			@new_deaths_per_million = new_deaths_per_million,
			@new_deaths_smoothed_per_million = new_deaths_smoothed_per_million,
			@reproduction_rate = reproduction_rate,
			@icu_patients = icu_patients,
			@icu_patients_per_million = icu_patients_per_million,
			@hosp_patients = hosp_patients,
			@hosp_patients_per_million = hosp_patients_per_million,
			@weekly_icu_admissions = weekly_icu_admissions,
			@weekly_icu_admissions_per_million = weekly_icu_admissions_per_million,
			@weekly_hosp_admissions = weekly_hosp_admissions,
			@weekly_hosp_admissions_per_million = weekly_hosp_admissions_per_million,
			@new_tests = new_tests,
			@total_tests = total_tests,
			@total_tests_per_thousand = total_tests_per_thousand,
			@new_tests_per_thousand = new_tests_per_thousand,
			@new_tests_smoothed = new_tests_smoothed,
			@new_tests_smoothed_per_thousand = new_tests_smoothed_per_thousand,
			@positive_rate = positive_rate,
			@tests_per_case = tests_per_case,
			@tests_units = tests_units,
			@total_vaccinations = total_vaccinations,
			@people_vaccinated = people_vaccinated,
			@people_fully_vaccinated = people_fully_vaccinated,
			@new_vaccinations = new_vaccinations,
			@new_vaccinations_smoothed = new_vaccinations_smoothed,
			@total_vaccinations_per_hundred = total_vaccinations_per_hundred,
			@people_vaccinated_per_hundred = people_vaccinated_per_hundred,
			@people_fully_vaccinated_per_hundred = people_fully_vaccinated_per_hundred,
			@new_vaccinations_smoothed_per_million = new_vaccinations_smoothed_per_million,
			@stringency_index = stringency_index,
			@population = population,
			@population_density = population_density,
			@median_age = median_age,
			@aged_65_older = aged_65_older,
			@aged_70_older = aged_70_older,
			@gdp_per_capita = gdp_per_capita,
			@extreme_poverty = extreme_poverty,
			@cardiovasc_death_rate = cardiovasc_death_rate,
			@diabetes_prevalence = diabetes_prevalence,
			@female_smokers = female_smokers,
			@male_smokers = male_smokers,
			@handwashing_facilities = handwashing_facilities,
			@hospital_beds_per_thousand = hospital_beds_per_thousand,
			@life_expectancy = life_expectancy,
			@human_development_index = human_development_index,
			@excess_mortality = excess_mortality
		FROM Temporal WHERE id_temporal = @iterador;
	
		EXEC InsertarDato @iso_code, @continent, @location, 
			@date, @total_cases, @new_cases, @new_cases_smoothed, 
			@total_deaths, @new_deaths, @new_deaths_smoothed, 
			@total_cases_per_million, @new_cases_per_million, 
			@new_cases_smoothed_per_million, @total_deaths_per_million, 
			@new_deaths_per_million, @new_deaths_smoothed_per_million, 
			@reproduction_rate, @icu_patients, @icu_patients_per_million, 
			@hosp_patients, @hosp_patients_per_million, @weekly_icu_admissions, 
			@weekly_icu_admissions_per_million, @weekly_hosp_admissions, 
			@weekly_hosp_admissions_per_million, @new_tests, @total_tests, 
			@total_tests_per_thousand, @new_tests_per_thousand, @new_tests_smoothed, 
			@new_tests_smoothed_per_thousand, @positive_rate, @tests_per_case, 
			@tests_units, @total_vaccinations, @people_vaccinated, 
			@people_fully_vaccinated, @new_vaccinations, @new_vaccinations_smoothed, 
			@total_vaccinations_per_hundred, @people_vaccinated_per_hundred, 
			@people_fully_vaccinated_per_hundred, @new_vaccinations_smoothed_per_million, 
			@stringency_index, @population, @population_density, @median_age, @aged_65_older, 
			@aged_70_older, @gdp_per_capita, @extreme_poverty, @cardiovasc_death_rate, 
			@diabetes_prevalence, @female_smokers, @male_smokers, @handwashing_facilities, 
			@hospital_beds_per_thousand, @life_expectancy, @human_development_index, 
			@excess_mortality
	
		SET @iterador = @iterador + 1;
	END

--Procedimiento para insertar los datos en el modelo
CREATE PROCEDURE InsertarDato @iso_code VARCHAR(255), @continent VARCHAR(255), @location VARCHAR(255), 
	@date VARCHAR(255), @total_cases VARCHAR(255), @new_cases VARCHAR(255), @new_cases_smoothed VARCHAR(255), 
	@total_deaths VARCHAR(255), @new_deaths VARCHAR(255), @new_deaths_smoothed VARCHAR(255), 
	@total_cases_per_million VARCHAR(255), @new_cases_per_million VARCHAR(255), 
	@new_cases_smoothed_per_million VARCHAR(255), @total_deaths_per_million VARCHAR(255), 
	@new_deaths_per_million VARCHAR(255), @new_deaths_smoothed_per_million VARCHAR(255), 
	@reproduction_rate VARCHAR(255), @icu_patients VARCHAR(255), @icu_patients_per_million VARCHAR(255), 
	@hosp_patients VARCHAR(255), @hosp_patients_per_million VARCHAR(255), @weekly_icu_admissions VARCHAR(255), 
	@weekly_icu_admissions_per_million VARCHAR(255), @weekly_hosp_admissions VARCHAR(255), 
	@weekly_hosp_admissions_per_million VARCHAR(255), @new_tests VARCHAR(255), @total_tests VARCHAR(255), 
	@total_tests_per_thousand VARCHAR(255), @new_tests_per_thousand VARCHAR(255), @new_tests_smoothed VARCHAR(255), 
	@new_tests_smoothed_per_thousand VARCHAR(255), @positive_rate VARCHAR(255), @tests_per_case VARCHAR(255), 
	@tests_units VARCHAR(255), @total_vaccinations VARCHAR(255), @people_vaccinated VARCHAR(255), 
	@people_fully_vaccinated VARCHAR(255), @new_vaccinations VARCHAR(255), @new_vaccinations_smoothed VARCHAR(255), 
	@total_vaccinations_per_hundred VARCHAR(255), @people_vaccinated_per_hundred VARCHAR(255), 
	@people_fully_vaccinated_per_hundred VARCHAR(255), @new_vaccinations_smoothed_per_million VARCHAR(255), 
	@stringency_index VARCHAR(255), @population VARCHAR(255), @population_density VARCHAR(255), @median_age VARCHAR(255), @aged_65_older VARCHAR(255), 
	@aged_70_older VARCHAR(255), @gdp_per_capita VARCHAR(255), @extreme_poverty VARCHAR(255), @cardiovasc_death_rate VARCHAR(255), 
	@diabetes_prevalence VARCHAR(255), @female_smokers VARCHAR(255), @male_smokers VARCHAR(255), @handwashing_facilities VARCHAR(255), 
	@hospital_beds_per_thousand VARCHAR(255), @life_expectancy VARCHAR(255), @human_development_index VARCHAR(255), 
	@excess_mortality VARCHAR(255)
	AS
	DECLARE @index_Casos INT;
	DECLARE @index_Continente INT;
	DECLARE @index_Detalle INT;
	DECLARE @index_Fecha INT;
	DECLARE @index_HospitalInfo INT;
	DECLARE @index_Icu INT;
	DECLARE @index_Muertes INT;
	DECLARE @index_Pais INT;
	DECLARE @index_Rates INT;
	DECLARE @index_Test INT;
	DECLARE @index_Vacuna INT;
	DECLARE @last_id_in_Continente INT;
	DECLARE @last_id_in_Pais INT;
	DECLARE @last_id_in_Fecha INT;
	DECLARE @last_id_in_Detalle INT;
	DECLARE @last_id_in_Casos INT;
	DECLARE @last_id_in_Muertes INT;
	DECLARE @last_id_in_Rates INT;
	DECLARE @last_id_in_Icu INT;
	DECLARE @last_id_in_HospitalInfo INT;
	DECLARE @last_id_in_Test INT;
	DECLARE @last_id_in_Vacuna INT;
	SET @index_Casos = 0;
	SET @index_Continente = 0;
	SET @index_Detalle = 0;
	SET @index_Fecha = 0;
	SET @index_HospitalInfo = 0;
	SET @index_Icu = 0;
	SET @index_Muertes = 0;
	SET @index_Pais = 0;
	SET @index_Rates = 0;
	SET @index_Test = 0;
	SET @index_Vacuna = 0;
	SET @last_id_in_Continente = 0;
	SET @last_id_in_Pais = 0;
	SET @last_id_in_Fecha = 0;
	SET @last_id_in_Detalle = 0;
	SET @last_id_in_Casos = 0;
	SET @last_id_in_Muertes = 0;
	SET @last_id_in_Rates = 0;
	SET @last_id_in_Icu = 0;
	SET @last_id_in_HospitalInfo = 0;
	SET @last_id_in_Test = 0;
	SET @last_id_in_Vacuna = 0;
	----------------------------------
	-- Insercion de los continentes --
	----------------------------------
	IF @continent IS NULL
		BEGIN
			SET @continent = 'Nulo';
		END
	SELECT @index_Continente = id_continente FROM Continente WHERE nombre = @continent;
	IF @index_Continente = 0
		BEGIN
			INSERT INTO Continente(nombre) VALUES(@continent)
			SET @last_id_in_Continente = IDENT_CURRENT('Continente');
		END
	ELSE
		BEGIN
			SET @last_id_in_Continente = @index_Continente;
		END
	--Si no existe el pais omitimos el dato
	IF @location IS NOT NULL
	BEGIN
		-----------------------------
		-- Insercion de los paises --
		-----------------------------
		SELECT @index_Pais = id_pais FROM Pais WHERE nombre = @location;
		IF @index_pais = 0
			BEGIN
				INSERT INTO Pais(id_continente, iso_code, nombre, population, population_density, median_age, 
					aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
					diabetes_prevalence, female_smokers, male_smokers, handwashing_facilities,
					life_expectancy, human_development_index, excess_mortality)
				VALUES(@last_id_in_Continente, ISNULL(@iso_code, ''), @location, ISNULL(CAST(@population AS BIGINT), 0), ISNULL(CAST(@population_density AS FLOAT), 0), 
					ISNULL(CAST(@median_age AS FLOAT), 0), ISNULL(CAST(@aged_65_older AS FLOAT), 0), ISNULL(CAST(@aged_70_older AS FLOAT), 0), 
					ISNULL(CAST(@gdp_per_capita AS FLOAT), 0), ISNULL(CAST(@extreme_poverty AS FLOAT), 0), ISNULL(CAST(@diabetes_prevalence AS FLOAT), 0), 
					ISNULL(CAST(@female_smokers AS FLOAT), 0), ISNULL(CAST(@male_smokers AS FLOAT), 0), ISNULL(CAST(@handwashing_facilities AS FLOAT), 0), 
					ISNULL(CAST(@life_expectancy AS FLOAT), 0), ISNULL(CAST(@human_development_index AS FLOAT), 0), ISNULL(CAST(@excess_mortality AS FLOAT), 0));
				SET @last_id_in_Pais = IDENT_CURRENT('Pais');
			END
		ELSE
			BEGIN
				SET @last_id_in_Pais = @index_Pais;
			END
	END
	-----------------------------
	-- Insercion de las fechas --
	-----------------------------
	SELECT @index_Fecha = id_fecha FROM Fecha WHERE fecha = @date;
	IF @index_Fecha = 0
		BEGIN
			INSERT INTO Fecha(fecha) VALUES(CAST(@date AS DATE));
			SET @last_id_in_Fecha = IDENT_CURRENT('Fecha');
		END
	ELSE
		BEGIN
			SET @last_id_in_Fecha = @index_Fecha;
		END
	----------------------------------
	-- Insercion de los Tablas 4-10 --
	----------------------------------
	SELECT @index_Casos = id_casos FROM Casos WHERE id_pais = @last_id_in_Pais AND id_fecha = @last_id_in_Fecha;
	IF @index_Casos = 0
		BEGIN
			-----------------------------
			-- Insercion de los casos --
			-----------------------------
			INSERT INTO Casos(id_pais, id_fecha, total_cases, new_cases, new_cases_smoothed, total_cases_per_million, 
				new_cases_per_million, new_cases_smoothed_per_million)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@total_cases AS BIGINT), 0), ISNULL(CAST(@new_cases AS BIGINT), 0),
				ISNULL(CAST(@new_cases_smoothed AS FLOAT), 0), ISNULL(CAST(@total_cases_per_million AS FLOAT), 0),
				ISNULL(CAST(@new_cases_per_million AS FLOAT), 0), ISNULL(CAST(@new_cases_smoothed_per_million AS FLOAT), 0));
			------------------------------
			-- Insercion de las muertes --
			------------------------------
			INSERT INTO Muertes(id_pais, id_fecha, total_deaths, new_deaths, new_deaths_smoothed, 
				total_deaths_per_million, new_deaths_per_million, new_deaths_smoothed_per_million)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@total_deaths AS BIGINT), 0),
				ISNULL(CAST(@new_deaths AS BIGINT), 0), ISNULL(CAST(@new_deaths_smoothed AS FLOAT), 0),
				ISNULL(CAST(@total_deaths_per_million AS FLOAT), 0), ISNULL(CAST(@new_deaths_per_million AS FLOAT), 0),
				ISNULL(CAST(@new_deaths_smoothed_per_million AS FLOAT), 0));
			----------------------------
			-- Insercion de los rates --
			----------------------------
			INSERT INTO Rates(id_pais, id_fecha, reproduction_rate, positive_rate, cardiovasc_death_rate)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@reproduction_rate AS FLOAT), 0),
				ISNULL(CAST(@positive_rate AS FLOAT), 0), ISNULL(CAST(@cardiovasc_death_rate AS FLOAT), 0));
			--------------------------
			-- Insercion de los icu --
			--------------------------
			INSERT INTO Icu(id_pais, id_fecha, icu_patients, icu_patients_per_million, weekly_icu_admissions, 
				weekly_icu_admissions_per_million)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@icu_patients AS BIGINT), 0),
				ISNULL(CAST(@icu_patients_per_million AS FLOAT), 0), ISNULL(CAST(@weekly_icu_admissions AS FLOAT), 0),
				ISNULL(CAST(@weekly_icu_admissions_per_million AS FLOAT), 0));
			--------------------------------------------
			-- Insercion de la info de los hospitales --
			--------------------------------------------
			INSERT INTO HospitalInfo(id_pais, id_fecha, hosp_patients, hosp_patients_per_million,
				weekly_hosp_admissions, weekly_hosp_admissions_per_million, hospital_beds_per_thousand)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@hosp_patients AS BIGINT), 0),
				ISNULL(CAST(@hosp_patients_per_million AS FLOAT), 0), ISNULL(CAST(@weekly_hosp_admissions AS FLOAT), 0),
				ISNULL(CAST(@weekly_hosp_admissions_per_million AS FLOAT), 0),
				ISNULL(CAST(@hospital_beds_per_thousand AS FLOAT), 0));
			---------------------------
			-- Insercion de los test --
			---------------------------
			INSERT INTO Test(id_pais, id_fecha, new_tests, total_tests, total_tests_per_thousand,
				new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, tests_per_case,
				tests_units)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@new_tests AS BIGINT), 0),
				ISNULL(CAST(@total_tests AS BIGINT), 0), ISNULL(CAST(@total_tests_per_thousand AS FLOAT), 0),
				ISNULL(CAST(@new_tests_per_thousand AS FLOAT), 0), ISNULL(CAST(@new_tests_smoothed AS FLOAT), 0),
				ISNULL(CAST(@new_tests_smoothed_per_thousand AS FLOAT), 0), ISNULL(CAST(@tests_per_case AS FLOAT), 0),
				ISNULL(@tests_units, ''));
			------------------------------
			-- Insercion de las vacunas --
			------------------------------
			INSERT INTO Vacuna(id_pais, id_fecha, total_vaccinations, people_vaccinated, people_fully_vaccinated,
				new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred,
				people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
				new_vaccinations_smoothed_per_million, stringency_index)
			VALUES(@last_id_in_Pais, @last_id_in_Fecha, ISNULL(CAST(@total_vaccinations AS BIGINT), 0),
				ISNULL(CAST(@people_vaccinated AS BIGINT), 0), ISNULL(CAST(@people_fully_vaccinated AS BIGINT), 0),
				ISNULL(CAST(@new_vaccinations AS BIGINT), 0), ISNULL(CAST(@new_vaccinations_smoothed AS FLOAT), 0),
				ISNULL(CAST(@total_vaccinations_per_hundred AS FLOAT), 0),
				ISNULL(CAST(@people_vaccinated_per_hundred AS FLOAT), 0),
				ISNULL(CAST(@people_fully_vaccinated_per_hundred AS FLOAT), 0),
				ISNULL(CAST(@new_vaccinations_smoothed_per_million AS FLOAT), 0),
				ISNULL(CAST(@stringency_index AS FLOAT), 0));
		END

--Llamada de procedimiento
EXEC recorridoTemporal;