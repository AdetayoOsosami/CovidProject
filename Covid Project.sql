CREATE DATABASE covidproject;

CREATE TABLE `covidproject`.`coviddeaths` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `iso_code` VARCHAR(255) NOT NULL,
  `continent` VARCHAR(255) NULL,
  `location` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `population` INT NULL,
  `total_cases` INT NULL,
  `new_cases` INT NULL,
  `new_cases_smoothed` DECIMAL(9,3) NULL,
  `total_deaths` INT NULL,
  `new_deaths` INT NULL,
  `new_deaths_smoothed` DECIMAL(8,3) NULL,
  `total_cases_per_million` DECIMAL(9,3) NULL,
  `new_cases_per_million` DECIMAL(8,3) NULL,
  `new_cases_smoothed_per_million` DECIMAL(7,3) NULL,
  `total_deaths_per_million` DECIMAL(7,3) NULL,
  `new_deaths_per_million` DECIMAL(6,3) NULL,
  `new_deaths_smoothed_per_million` DECIMAL(6,3) NULL,
  `reproduction_rate` DECIMAL(3,2) NULL,
  `icu_patients` INT NULL,
  `icu_patients_per_million` DECIMAL(6,3) NULL,
  `hosp_patients` INT NULL,
  `hosp_patients_per_million` DECIMAL(7,3) NULL,
  `weekly_icu_admissions` INT NULL,
  `weekly_icu_admissions_per_million` DECIMAL(6,3) NULL,
  `weekly_hosp_admissions` INT NULL,
  `weekly_hosp_admissions_per_million` DECIMAL(6,3) NULL,
  PRIMARY KEY (`id`));
  
  
  
  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths.csv'
INTO TABLE coviddeaths
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(iso_code,continent,location,`date`,population,total_cases,new_cases,new_cases_smoothed,total_deaths,new_deaths,new_deaths_smoothed,total_cases_per_million,
new_cases_per_million,new_cases_smoothed_per_million,total_deaths_per_million,new_deaths_per_million,new_deaths_smoothed_per_million,reproduction_rate,
icu_patients,icu_patients_per_million,hosp_patients,hosp_patients_per_million,weekly_icu_admissions,weekly_icu_admissions_per_million)
SET continent = IF(continent = '', NULL, continent),
	new_cases_smoothed = IF(new_cases_smoothed = '', NULL, new_cases_smoothed),
	total_deaths = IF(total_deaths = '', NULL, total_deaths),
    new_deaths = IF(new_deaths = '', NULL, new_deaths),
    new_deaths_smoothed = IF(new_deaths_smoothed = '', NULL, new_deaths_smoothed),
    new_cases_smoothed_per_million = IF(new_cases_smoothed_per_million = '', NULL, new_cases_smoothed_per_million),
    total_deaths_per_million = IF(total_deaths_per_million = '', NULL, total_deaths_per_million),
    new_deaths_per_million = IF(new_deaths_per_million = '', NULL, new_deaths_per_million),
    new_deaths_smoothed_per_million = IF(new_deaths_smoothed_per_million = '', NULL, new_deaths_smoothed_per_million),
    reproduction_rate = IF(reproduction_rate = '', NULL, reproduction_rate),
    icu_patients = IF(icu_patients = '', NULL, icu_patients),
    icu_patients_per_million = IF(icu_patients_per_million = '', NULL, icu_patients_per_million),
    hosp_patients = IF(hosp_patients = '', NULL, hosp_patients),
    hosp_patients_per_million = IF(hosp_patients_per_million = '', NULL, hosp_patients_per_million),
    weekly_icu_admissions = IF(weekly_icu_admissions = '', NULL, weekly_icu_admissions),
    weekly_icu_admissions_per_million = IF(weekly_icu_admissions_per_million = '', NULL, weekly_icu_admissions_per_million);
    


  CREATE TABLE `covidproject`.`covidvaccinations` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `iso_code` VARCHAR(255) NOT NULL,
  `continent` VARCHAR(255) NULL,
  `location` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `new_tests` INT NULL,
  `total_tests` INT NULL,
  `total_tests_per_thousand` DECIMAL(8,3) NULL,
  `new_tests_per_thousand` DECIMAL(6,3) NULL,
  `new_tests_smoothed` INT NULL,
  `new_tests_smoothed_per_thousand` DECIMAL(6,3) NULL,
  `positive_rate` DECIMAL(5,4) NULL,
  `tests_per_case` DECIMAL(7,1) NULL,
  `tests_units` VARCHAR(45) NULL,
  `total_vaccinations` INT NULL,
  `people_vaccinated` INT NULL,
  `people_fully_vaccinated` INT NULL,
  `total_boosters` INT NULL,
  `new_vaccinations` INT NULL,
  `new_vaccinations_smoothed` INT NULL,
  `total_vaccinations_per_hundred` DECIMAL(5,2) NULL,
  `people_vaccinated_per_hundred` DECIMAL(5,2) NULL,
  `people_fully_vaccinated_per_hundred` DECIMAL(5,2) NULL,
  `total_boosters_per_hundred` DECIMAL(4,2) NULL,
  `new_vaccinations_smoothed_per_million` INT NULL,
  `new_people_vaccinated_smoothed` INT NULL,
  `new_people_vaccinated_smoothed_per_hundred` DECIMAL(5,3) NULL,
  `stringency_index` DECIMAL(4,2) NULL,
  `population_density` DECIMAL(8,3) NULL,
  `median_age` DECIMAL(3,1) NULL,
  `aged_65_older` DECIMAL(5,3) NULL,
  `aged_70_older` DECIMAL(5,3) NULL,
  `gdp_per_capita` DECIMAL(9,3) NULL,
  `extreme_poverty` DECIMAL(3,1) NULL,
  `cardiovasc_death_rate` DECIMAL(6,3) NULL,
  `diabetes_prevalence` DECIMAL(4,2) NULL,
  `female_smokers` DECIMAL(3,1) NULL,
  `male_smokers` DECIMAL(3,1) NULL,
  `handwashing_facilities` DECIMAL(5,3) NULL,
  `hospital_beds_per_thousand` DECIMAL(4,2) NULL,
  `life_expectancy` DECIMAL(4,2) NULL,
  `human_development_index`DECIMAL(4,3) NULL,
  `excess_mortality_cumulative_absolute` DECIMAL(8,1) NULL,
  `excess_mortality_cumulative` DECIMAL(5,2) NULL,
  `excess_mortality` DECIMAL(5,2) NULL,
  `excess_mortality_cumulative_per_million` DECIMAL(10,6) NULL,
  PRIMARY KEY (`id`));
  
  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidVaccinations.csv'
INTO TABLE covidvaccinations
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(iso_code,continent,location,`date`,new_tests,total_tests,total_tests_per_thousand,new_tests_per_thousand,new_tests_smoothed,new_tests_smoothed_per_thousand,positive_rate,tests_per_case,
tests_units,total_vaccinations,people_vaccinated,people_fully_vaccinated,total_boosters,new_vaccinations,new_vaccinations_smoothed,total_vaccinations_per_hundred,
people_vaccinated_per_hundred,people_fully_vaccinated_per_hundred,total_boosters_per_hundred,new_vaccinations_smoothed_per_million,new_people_vaccinated_smoothed,new_people_vaccinated_smoothed_per_hundred,
stringency_index,population_density,median_age,aged_65_older,aged_70_older,gdp_per_capita,extreme_poverty,cardiovasc_death_rate,diabetes_prevalence,female_smokers,
male_smokers,handwashing_facilities,hospital_beds_per_thousand,life_expectancy,human_development_index,excess_mortality_cumulative_absolute,excess_mortality_cumulative,
excess_mortality,excess_mortality_cumulative_per_million)
SET continent = IF(continent = '', NULL, continent),
	new_tests = IF(new_tests = '', NULL, new_tests),
	total_tests = IF(total_tests = '', NULL, total_tests),
    total_tests_per_thousand = IF(total_tests_per_thousand = '', NULL, total_tests_per_thousand),
    new_tests_per_thousand = IF(new_tests_per_thousand = '', NULL, new_tests_per_thousand),
    new_tests_smoothed = IF(new_tests_smoothed = '', NULL, new_tests_smoothed),
    new_tests_smoothed_per_thousand = IF(new_tests_smoothed_per_thousand = '', NULL, new_tests_smoothed_per_thousand),
    positive_rate = IF(positive_rate = '', NULL, positive_rate),
    tests_per_case = IF(tests_per_case = '', NULL, tests_per_case),
    tests_units = IF(tests_units = '', NULL, tests_units),
    total_vaccinations = IF(total_vaccinations = '', NULL, total_vaccinations),
    people_vaccinated = IF(people_vaccinated = '', NULL, people_vaccinated),
    people_fully_vaccinated = IF(people_fully_vaccinated = '', NULL, people_fully_vaccinated),
    total_boosters = IF(total_boosters = '', NULL, total_boosters),
    new_vaccinations = IF(new_vaccinations = '', NULL, new_vaccinations),
    new_vaccinations_smoothed = IF(new_vaccinations_smoothed = '', NULL, new_vaccinations_smoothed),
    total_vaccinations_per_hundred = IF(total_vaccinations_per_hundred = '', NULL, total_vaccinations_per_hundred),
	people_vaccinated_per_hundred = IF(people_vaccinated_per_hundred = '', NULL, people_vaccinated_per_hundred),
    people_fully_vaccinated_per_hundred = IF(people_fully_vaccinated_per_hundred = '', NULL, people_fully_vaccinated_per_hundred),
    total_boosters_per_hundred = IF(total_boosters_per_hundred = '', NULL, total_boosters_per_hundred),
    new_vaccinations_smoothed_per_million = IF(new_vaccinations_smoothed_per_million = '', NULL, new_vaccinations_smoothed_per_million),
    new_people_vaccinated_smoothed = IF(new_people_vaccinated_smoothed = '', NULL, new_people_vaccinated_smoothed),
    new_people_vaccinated_smoothed_per_hundred = IF(new_people_vaccinated_smoothed_per_hundred = '', NULL, new_people_vaccinated_smoothed_per_hundred),
    stringency_index = IF(stringency_index = '', NULL, stringency_index),
    population_density = IF(population_density = '', NULL, population_density),
    median_age = IF(median_age = '', NULL, median_age),
    aged_65_older = IF(aged_65_older = '', NULL, aged_65_older),
    aged_70_older = IF(aged_70_older = '', NULL, aged_70_older),
    gdp_per_capita = IF(gdp_per_capita = '', NULL, gdp_per_capita),
    extreme_poverty = IF(extreme_poverty = '', NULL, extreme_poverty),
    cardiovasc_death_rate = IF(cardiovasc_death_rate = '', NULL, cardiovasc_death_rate),
    diabetes_prevalence = IF(diabetes_prevalence = '', NULL, diabetes_prevalence),
    female_smokers = IF(female_smokers = '', NULL, female_smokers),
    male_smokers = IF(male_smokers = '', NULL, male_smokers),
    handwashing_facilities = IF(handwashing_facilities = '', NULL, handwashing_facilities),
    hospital_beds_per_thousand = IF(hospital_beds_per_thousand = '', NULL, hospital_beds_per_thousand),
    life_expectancy = IF(life_expectancy = '', NULL, life_expectancy),
    human_development_index = IF(human_development_index = '', NULL, human_development_index),
    excess_mortality_cumulative_absolute = IF(excess_mortality_cumulative_absolute = '', NULL, excess_mortality_cumulative_absolute),
    excess_mortality_cumulative = IF(excess_mortality_cumulative = '', NULL, excess_mortality_cumulative),
    excess_mortality = IF(excess_mortality = '', NULL, excess_mortality),
    excess_mortality_cumulative_per_million = IF(excess_mortality_cumulative_per_million = '', NULL, excess_mortality_cumulative_per_million);
    
      /*To select the data that I'll be using*/
    
    SELECT location, `date`, population, total_cases, new_cases, total_deaths
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    ORDER BY 1,2;
    
    /*Looking at Total Cases vs Total Deaths*/
    
     SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    ORDER BY 1,2;
    
    /*To search for DeathPercentage in United Kingdom*/
    
    SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Kingdom%'
    ORDER BY 1,2;
    
        /*To search for DeathPercentage in Afghanistan*/
    SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Afghanistan%'
    ORDER BY 1,2;
    
        /*To search for DeathPercentage in United States*/
    SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%States%'
    ORDER BY 1,2;
    /*This shows 0.95% DeathPercentage for United Kingdom on the 29th of January, 2022 as compared to 4.59% in Afghanistan and 1.19% in United States*/
    /*It shows the likelihood of dying if Covid is contracted in a location*/
    
    /*Looking at Total Cases vs Population*/
    SELECT location, `date`, total_cases, population, (total_cases/population)*100 AS CovidCasesPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Kingdom%'
    ORDER BY 1,2;
    
    /*This shows that by the 29th of January, 2022, 24.11% of the total population of the United Kingdom has contracted Covid*/
    
    
    /*Looking at countries with the highest infection rate compared to population*/
    SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS CovidCasesPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY location, population
    ORDER BY CovidCasesPercentage DESC;
    
    /*Showing countries with highest death count per population*/
    SELECT location, MAX(total_deaths) AS TotalDeathCount
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY location
    ORDER BY TotalDeathCount DESC;
    


/*Grouping by continent*/
 SELECT continent, MAX(total_deaths) AS TotalDeathCount
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY continent
    ORDER BY TotalDeathCount DESC;
    
     SELECT location, MAX(total_deaths) AS TotalDeathCount
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NULL
    GROUP BY location
    ORDER BY TotalDeathCount DESC;
    
    /*Global Numbers*/
    
SELECT `date`, SUM(new_cases) AS TotalCases, SUM(new_deaths) AS TotalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY `date`
    ORDER BY 1,2;
    
    /*To show the overall deathpercentage of the world*/
    SELECT SUM(new_cases) AS TotalCases, SUM(new_deaths) AS TotalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    ORDER BY 1,2;
    /*1.51% of thw world population whohave been infected with Covid-19 has died*/
    
    /*Joining table coviddeaths and covidvaccinations*/
    
    SELECT *
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date` ;
    
    /*Looking at total population vs vaccinations*/
    
        SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL
    ORDER BY 2,3;
    
    
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingVaccinatedPeople
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL
    ORDER BY 2,3;
    
    /*USE CTE*/
    /*Showing the total percentage of people vaccinated based on location*/
    WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingVaccinatedPeople)
    AS
     (SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingVaccinatedPeople
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL
    )
    SELECT *, (RollingVaccinatedPeople/population)*100
    FROM PopvsVac;
   
    
    CREATE TABLE `PercentPopulationVaccinated`
    (
    continent varchar(255),
    location varchar(255),
    `date` date,
    population numeric,
    new_vaccinations numeric,
    RollingVaccinatedPeople numeric);
    
    INSERT INTO `PercentPopulationVaccinated`
    
    SELECT dea.continent, dea.location, dea.`date`, dea.population, vac.new_vaccinations, 
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingVaccinatedPeople
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL;
    
     SELECT *, (RollingVaccinatedPeople/population)*100
    FROM `PercentPopulationVaccinated`;
    
    /*Creating views to store data later for visualization*/
    
    CREATE VIEW Percentvaccinatedpopulation AS
    SELECT dea.continent, dea.location, dea.`date`, dea.population, vac.new_vaccinations, 
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingVaccinatedPeople
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL;
    
     /*Looking at Total Cases vs Total Deaths*/
    CREATE VIEW TotalCasesvsTotalDeaths AS
     SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    ORDER BY 1,2;
    
    CREATE VIEW deathpercentageinunitedkingdom AS
    SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Kingdom%'
    ORDER BY 1,2;
    
    CREATE VIEW deathpercentageinafghanistan AS
    SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Afghanistan%'
    ORDER BY 1,2;
    
    CREATE VIEW deathpercentageinunitedstates AS
     SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%States%'
    ORDER BY 1,2;
    
    CREATE VIEW totalcasesvspopulationinunitedkingdom AS
    SELECT location, `date`, total_cases, population, (total_cases/population)*100 AS CovidCasesPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    AND location LIKE '%Kingdom%'
    ORDER BY 1,2;
    
    CREATE VIEW countrieswiththehighestinfectionrate AS
    SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS CovidCasesPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY location, population
    ORDER BY CovidCasesPercentage DESC;
    
    CREATE VIEW countrieswiththehighestdeathcountperpopulation AS
    SELECT location, MAX(total_deaths) AS TotalDeathCount
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY location
    ORDER BY TotalDeathCount DESC;
    
    
    CREATE VIEW totaldeathcountbycontinent AS
    SELECT continent, MAX(total_deaths) AS TotalDeathCount
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY continent
    ORDER BY TotalDeathCount DESC;
    
    CREATE VIEW globalnumbers AS
    SELECT `date`, SUM(new_cases) AS TotalCases, SUM(new_deaths) AS TotalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
    FROM `covidproject`.`coviddeaths`
    WHERE continent IS NOT NULL
    GROUP BY `date`
    ORDER BY 1,2;
    
    CREATE VIEW totalpopulationvsvaccinations AS
            SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
    FROM `covidproject`.`coviddeaths` dea
    JOIN `covidproject`.`covidvaccinations` vac
    ON dea.location = vac.location
    AND dea.`date` = vac.`date`
    WHERE dea.continent IS NOT NULL
    ORDER BY 2,3;
    
    