 --1. Select all information from product_emissions
 
select * 
from product_emissions pe ;

--2. Return the most recent and most last year for which data was collected

select MIN(year),  MAX(year)
from product_emissions;

--3. Emissions by country
-- Group by country, select country and the sum of total carbon_footprint_pcf by country, aliasing as total_country_footprint

select country, ROUND(SUM(carbon_footprint_pcf), 1) as total_country_footprint
from product_emissions pe 
group by country
order by total_country_footprint desc;

--4. Spain has a lot of emissions! Where do they come from?

select company, industry_group, ROUND(SUM(carbon_footprint_pcf), 1) as total_carbon_footprint_pcf
from product_emissions pe 
group by company, industry_group, country
having country = 'Spain'
order by total_carbon_footprint_pcf DESC;

--5. Enissions reported by Gamesa Corporación Tecnológica, S.A.

select * 
from product_emissions pe 
where company like 'Gamesa Corp%';

--6. Return industry_group and a rounded total of carbon_footprint_pcf, aliased as total_industry_footprint
-- Limit to data for 2015 and order by total_industry_footprint

SELECT country, industry_group, ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint
FROM product_emissions
GROUP BY country, industry_group, year
HAVING year = 2015
ORDER BY total_industry_footprint DESC;

SELECT year, country, industry_group, ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint
FROM product_emissions
GROUP BY year, country, industry_group 
ORDER BY total_industry_footprint DESC;

--7. Return the industry groups and a count of the number of records for each group
-- Limit the results to only those from 2015 and alias the count as count_industry
-- Order by count_industry, descending

SELECT industry_group, COUNT(*) AS count_industry
FROM product_emissions
GROUP BY industry_group, year
HAVING year = 2015
ORDER BY count_industry DESC;

--8. Return country, industry_group, company, and product_name for all records reporting in the industry_group Electrical Equipment and Machinery during 2015

SELECT country, industry_group, company, product_name, weight_kg, carbon_footprint_pcf 
FROM product_emissions
WHERE year = 2015 AND industry_group = 'Electrical Equipment and Machinery';

--9. Return product_name, company, and all stages of pcf (product carbon footprints) emissions, weight_kg, 
-- carbon_footprint_pcf for Electrical Equipment and Machinery in 2015

SELECT product_name, 
    company, 
    upstream_percent_total_pcf, 
    operations_percent_total_pcf, 
    downstream_percent_total_pcf,
    weight_kg, 
    carbon_footprint_pcf
FROM product_emissions
WHERE year = 2015
    AND industry_group = 'Electrical Equipment and Machinery';

--10. To check what is the total carbon emissions per product weight and define which country has the highest contribution in this process

with pcf_per_weight as (
select *, carbon_footprint_pcf/weight_kg as carbon_footprint_per_weight
FROM product_emissions
)
select country, ROUND(SUM(carbon_footprint_pcf), 1) as total_country_footprint, 
ROUND(SUM(carbon_footprint_per_weight), 1) as total_country_footprint_per_weight
from pcf_per_weight 
group by country
order by total_country_footprint desc;

with pcf_per_weight as (
select *, carbon_footprint_pcf/weight_kg as carbon_footprint_per_weight
FROM product_emissions
)
select country, ROUND(SUM(carbon_footprint_pcf), 1) as total_country_footprint, 
ROUND(SUM(carbon_footprint_per_weight), 1) as total_country_footprint_per_weight
from pcf_per_weight 
group by country
order by total_country_footprint_per_weight desc;

with pcf_per_weight as (
select *, carbon_footprint_pcf/weight_kg as carbon_footprint_per_weight
FROM product_emissions
)
select country, ROUND(SUM(carbon_footprint_pcf), 1) as total_country_footprint, 
ROUND(SUM(carbon_footprint_per_weight), 1) as total_country_footprint_per_weight
from pcf_per_weight 
group by country, year
HAVING year = 2015
order by total_country_footprint_per_weight desc;





