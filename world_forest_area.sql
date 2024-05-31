-- check the table
SELECT * FROM forest_area;

-- top 20 countries by total forest area
SELECT
	country,
    `2021`
FROM forest_area
WHERE country <> 'World'
ORDER BY `2021` DESC
LIMIT 20;

-- time series for the world
SELECT *
FROM forest_area
WHERE country = 'World';

-- time series for the United States
SELECT *
FROM forest_area
WHERE country = 'United States';

-- time series for Brazil
SELECT *
FROM forest_area
WHERE country = 'Brazil';

-- calculate growth rate then query top 10 country growth rates
SELECT
	country,
    (`2021` - `1990`) / `1990` AS growth_rate,
    RANK() OVER (ORDER BY (`2021` - `1990`) / `1990` DESC) AS growth_rank
FROM forest_area
WHERE country <> 'World'
ORDER BY growth_rate DESC
LIMIT 20;

-- bottom 20 country growth rates
SELECT
	country,
    (`2021` - `1990`) / `1990` AS growth_rate
FROM forest_area
WHERE country <> 'World'
ORDER BY growth_rate
LIMIT 20;

-- calculate per capita forest area and top 20 country per capita areas
SELECT
	country,
    `2021` / population AS per_capita_area,
    RANK() OVER (ORDER BY `2021` / population DESC) AS per_capita_rank
FROM forest_area
ORDER BY per_capita_area DESC
LIMIT 20;