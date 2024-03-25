/*
Portfolio Project
*/

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProjects..CovidDeaths
Order By 1, 2

--Looking at total cases vs total deaths
--Shows death percentage in my country
--Here altered columns 'total_cases' and 'total_deaths' from nvarchar to float for calculation
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProjects..CovidDeaths
WHERE location like 'B%ng%sh'
Order By 2 DESC --for getting latest info

--Looking for total cases vs population
SELECT location, date, population, total_cases, (total_cases/population)*100 as AffectedPercentage
FROM PortfolioProjects..CovidDeaths
WHERE location like 'B%ng%sh'
ORDER BY 1,2 DESC


