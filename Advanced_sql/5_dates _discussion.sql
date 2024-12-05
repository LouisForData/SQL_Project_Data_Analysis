-- Retrieve all columns from the job_postings_fact table
SELECT * FROM job_postings_fact;

-- Select only the job_posted_date column and limit the result to 10 rows
SELECT job_posted_date 
FROM job_postings_fact
LIMIT 10;

-- Example of casting strings to different data types
SELECT '2024-11-17':: DATE;

SELECT 
    '2023-02-19':: DATE,  -- Converts string to DATE type
    '123':: INTEGER,      -- Converts string to INTEGER type
    'true':: BOOLEAN,     -- Converts string to BOOLEAN type
    '3.24':: REAL;        -- Converts string to REAL (floating-point number) type

-- Retrieve specific columns with aliases for readability
SELECT 
    job_title_short AS Title,  -- Renames job_title_short to Title
    job_location AS location,  -- Renames job_location to location
    job_posted_date AS date    -- Renames job_posted_date to date
FROM 
    job_postings_fact
    ;

-- Casting job_posted_date to DATE type, if it's originally of a different type

 

SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date:: DATE AS date
FROM 
    job_postings_fact;


SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date:: TIME AS TIME
FROM 
    job_postings_fact
    
LIMIT 10;


-- Retrieve rows with timezone conversion and limit to 5 rows
SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EAT' AS date  -- Adjusts the timezone to East Africa Time
FROM 
    job_postings_fact
LIMIT 5;

-- Extract the month from job_posted_date
SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EAT' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month  -- Extracts the month from job_posted_date
FROM 
    job_postings_fact
LIMIT 5;

-- Extract both month and year from job_posted_date for additional time analysis
SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EAT' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year  -- Extracts the year from job_posted_date
FROM 
    job_postings_fact
LIMIT 5;

-- Identify job trends by extracting the month from job_posted_date
SELECT
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
LIMIT 5;

-- Count jobs by month to analyze monthly posting trends
SELECT
    COUNT(job_id) AS Number_of_jobs,                       -- Counts job postings per month
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY
 Number_of_jobs DESC
;

-- Analyze trends specifically for Data Analyst job postings by month
SELECT
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'     -- Filters for Data Analyst jobs
GROUP BY
    month
ORDER BY
    month ASC;                          -- Orders by month in ascending order

-- Number of jobs 

SELECT
    COUNT(job_id) AS Number_of_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'     -- Filters for Data Analyst jobs
GROUP BY
    month
ORDER BY
    Number_of_jobs DESC; 
/*

Summary

This SQL script effectively covers multiple aspects:

    Data retrieval and column aliasing for clarity
    Typecasting and date formatting
    Time zone adjustments
    Date extraction (month and year) for trend analysis
    Aggregation by month with filtering for specific job titles



*/




SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date ) = 1
LIMIT 10
;

-- Create for only January

SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date ) = 1
 
;

-- Create a table for January

CREATE TABLE january_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


-- February
CREATE TABLE february_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


    
/**
-- April
CREATE TABLE april_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May
CREATE TABLE may_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June
CREATE TABLE june_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July
CREATE TABLE july_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August
CREATE TABLE august_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September
CREATE TABLE september_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October
CREATE TABLE october_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November
CREATE TABLE november_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December
CREATE TABLE december_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 12;



**/

SELECT * FROM march_jobs;