create database olympic;
use olympic;



drop table Olympics_Medals;

CREATE TABLE Olympics_Medals (
    Year INT,
    Ranks VARCHAR(10),
    NOC VARCHAR(100),
    Gold INT,
    Silver INT,
    Bronze INT,
    Total INT);
    
load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Olympics (1896-2024).csv"
into table olympics_medals
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;




show variables like 'local_infile';

set global local_infile =1;



select * from Olympics_Medals;
show variables like 'secure_file_priv';

-- (1)List  of all  Olympic years in the dataset
select distinct year from olympics_medals;

use olympic;

-- (2) Find total medals won in all Olympics?
SELECT SUM(Total) FROM olympics_medals;

 -- (3) Find countries that won no gold medals in 2024
SELECT NOC FROM olympics_medals 
WHERE Year = 2024 AND Gold = 0;

-- (4) Find which country had the highest rank in 2000 Olympics?
SELECT NOC FROM olympics_medals 
WHERE Year = 2000 AND Ranks = '1';

-- (5) Find how many countries participated in each Olympic year?
SELECT Year, COUNT(DISTINCT NOC) AS Total_Countries 
FROM olympics_medals 
GROUP BY Year;

-- (6) List top 5 countries in 2024 by gold medals?
SELECT NOC, Gold FROM olympics_medals 
WHERE Year = 2024 
ORDER BY Gold DESC 
LIMIT 5;

-- (7)Find all Olympic years where the United States ranked ?
SELECT Year FROM olympics_medals 
WHERE NOC = 'United States' AND Ranks = '1';

-- (8)  Find the average number of total medals won per Olympics by Germany
SELECT AVG(Total) FROM olympics_medals
WHERE NOC = 'Germany';

-- (9) Find all countries that have won at least 10 gold medals in a single Olympics?
SELECT Year, NOC, Gold FROM olympics_medals 
WHERE Gold >= 10 
ORDER BY Gold DESC;

-- (10) Find the total medals won by China before the year 2000?
SELECT SUM(Total) FROM olympics_medals
WHERE NOC = 'China' AND Year < 2000;

-- (11) Find the average number of gold medals won per Olympics by Australia
SELECT AVG(Gold) FROM olympics_medals 
WHERE NOC = 'Australia';

-- (12)Find the Olympic year in which the most silver medals were awarded?
SELECT Year, SUM(Silver) AS Total_Silver 
FROM olympics_medals 
GROUP BY Year 
ORDER BY Total_Silver DESC 
LIMIT 1;

-- (13)Find all countries that won exactly 0 silver medals in the 2016 Olympics?
SELECT NOC FROM olympics_medals 
WHERE Year = 2016 AND Silver = 0;

-- (14)Find the percentage of total medals won by Russia in 2016?
SELECT (SUM(Total) * 100.0 / (SELECT SUM(Total) FROM olympics_medals WHERE Year = 2016)) AS Medal_Percentage 
FROM olympics_medals 
WHERE Year = 2016 AND NOC = 'Russia';

-- (15) Find the country that has won at least 1 medal in the most Olympic years?
SELECT NOC, COUNT(DISTINCT Year) AS Medal_Years 
FROM olympics_medals 
WHERE Total > 0 
GROUP BY NOC 
ORDER BY Medal_Years DESC 
LIMIT 1;

-- (16) Find all Olympic years where only 1 country won more than 50 medals
SELECT Year FROM olympics_medals 
WHERE Total > 50 
GROUP BY Year 
HAVING COUNT(NOC) = 1;

-- (17) Find how many times France finished in the top 5 overall?
SELECT COUNT(*) FROM olympics_medals
WHERE NOC = 'France' AND Ranks BETWEEN 1 AND 5;

-- (18) Find the year in which the smallest number of medals were awarded?
SELECT Year, SUM(Total) AS Total_Medals 
FROM olympics_medals 
GROUP BY Year 
ORDER BY Total_Medals ASC 
LIMIT 1;

-- (19) Find all Olympic years where the host country ranked?
SELECT Year, NOC FROM olympics_medals 
WHERE Ranks = '1' AND NOC IN (SELECT DISTINCT NOC FROM olympics_medals);

-- (20)Find all Olympic years where at least 5 countries won 20+ gold medals?
SELECT Year FROM olympics_medals 
WHERE Gold >= 20 
GROUP BY Year 
HAVING COUNT(NOC) >= 5;

USE olympic;


INSIGHTS:
TOP PERFORMANCE IN 2024:
 -> The united states ranked first with 126 total medals.
gold=40,silver=44,bronze=42
 -> China had the same number of Gold medals (40)
 but ranked second due to fewer total medals (91).                       
  -> France, the host of the 2024 Olympics, ranked 5th with 64 medals.
  -> Japan (3rd) and Australia (4th) also performed well, winning a good number of medals.






















































































































