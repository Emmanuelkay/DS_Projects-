
-- left join to create a view table 

SELECT 
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment
FROM 
    united_nations.Geographic_Location as loc
LEFT JOIN united_nations.Economic_Indicators as eco
ON eco.Country_name = loc.Country_name
LIMIT 10;


--With a region filterr 

SELECT 
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment
FROM 
    united_nations.Geographic_Location as loc
LEFT JOIN united_nations.Economic_Indicators as eco
ON eco.Country_name = loc.Country_name
WHERE REGION = 'Sub-Saharan Africa';


-- To fill in Null values

SELECT 
    loc.Country_name,
    eco.Time_period,
    IFNULL (eco.Pct_unemployment,33.65) as Pct_unemployment_imputed
FROM 
    united_nations.Geographic_Location as loc
LEFT JOIN united_nations.Economic_Indicators as eco
ON eco.Country_name = loc.Country_name
WHERE REGION = 'Sub-Saharan Africa';

-- Finally creating view table

CREATE VIEW united_nations.Country_Unemployment_Rate
AS

SELECT 
    loc.Country_name,
    eco.Time_period,
    IFNULL (eco.Pct_unemployment,33.65) as PCT_unemployment_imputed
FROM 
    united_nations.Geographic_Location as loc
LEFT JOIN united_nations.Economic_Indicators as eco
ON eco.Country_name = loc.Country_name
WHERE REGION = 'Sub-Saharan Africa'
limit 10;


-- To verify we are able to see the table created


