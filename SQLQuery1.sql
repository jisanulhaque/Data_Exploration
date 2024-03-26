/*
Portfolio Project
*/

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProjects..CovidDeaths
Order By 1, 2

--Looking at total cases vs total deaths
--Shows death percentage in my country
--Here altered columns 'total_cases' and 'total_deaths' from nvarchar to float for arithmatic operations

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProjects..CovidDeaths
WHERE location like 'B%ng%sh' AND continent is not NULL
Order By 2 DESC --for getting latest info

--Looking for total cases vs population
--Shows what percentage of population got Covid

SELECT location, date, population, total_cases, (total_cases/population)*100 as InfectedPercentage
FROM PortfolioProjects..CovidDeaths
WHERE location like 'B%ng%sh' AND continent is not NULL
ORDER BY 1,2 DESC

--Looking at countries having heigest infected rate compared to population

SELECT location, population, MAX(total_cases) MaxInfected, MAX(total_cases/population)*100 as MaxInfectedPercentage
FROM PortfolioProjects..CovidDeaths
WHERE continent is not NULL
Group By location, population
Order By 4 DESC

--Looking for highest death count per population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProjects..CovidDeaths
--WHERE location like'Ban%%sh' --DeathCount of Bangladesh
WHERE continent is not NULL
Group By location
Order By TotalDeathCount DESC

