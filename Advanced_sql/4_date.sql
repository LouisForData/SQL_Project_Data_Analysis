SELECT * FROM job_postings_fact;


SELECT job_posted_date 
FROM job_postings_fact
LIMIT 10;


-- If you want to convert to a data type

SELECT '2023-02-19' :: DATE;



SELECT 
    '2023-02-19' :: DATE,
    '123':: INTEGER,
    'true':: BOOLEAN,
    '3.24':: REAL

;


SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AS date 
FROM 
    job_postings_fact;


-- Change to time

SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date:: DATE AS date 
FROM 
    job_postings_fact;

-- Working with timezone



SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AS date 
FROM 
    job_postings_fact
LIMIT 5    
    
    ;





SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC'  AT TIME ZONE 'EAT' AS date 
FROM 
    job_postings_fact
LIMIT 5    
    
    ;


-- Extract Month 




SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC'  AT TIME ZONE 'EAT' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
LIMIT 5    
    
    ;


-- Year

SELECT 
    job_title_short AS Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC'  AT TIME ZONE 'EAT' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
    job_postings_fact
LIMIT 5    
    
    ;


-- Lets say we want to check the job trend

SELECT
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS date_month

FROM
    job_postings_fact
LIMIT 5;



SELECT
   COUNT( job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month

FROM
    job_postings_fact
GROUP BY
    month
LIMIT 5;


SELECT
   COUNT( job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month

FROM
    job_postings_fact

WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
    
ORDER BY
    month ASC 
;