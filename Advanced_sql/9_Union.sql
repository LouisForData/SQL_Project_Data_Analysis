-- Get jobs and companies from January 

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

-- Get jobs and companies from February

SELECT 
    job_title_short,
    company_id,
    job_location

FROM
    february_jobs

-- Get jobs and companies from March

UNION

SELECT 
    job_title_short,
    company_id,
    job_location

FROM
    march_jobs;


-- using UNION ALL


-- Get jobs and companies from January 

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

-- Get jobs and companies from February

SELECT 
    job_title_short,
    company_id,
    job_location

FROM
    february_jobs

-- Get jobs and companies from March

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location

FROM
    march_jobs;


/*

Find job posting from the first quarter that have a salary greater than $ 70k.
- Combine job posting tables from the first quarter
- Gets job posting with an average yearly salary > $ 70,000


*/

SELECT *
FROM(
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings


SELECT 
quarter1_job_postings.job_title_short,
quarter1_job_postings.job_location,
quarter1_job_postings.job_via,
quarter1_job_postings.job_posted_date :: date
FROM(
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings

WHERE
    salary_year_avg > 7000 AND 
    job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    ;

--- Without adding the alies quarter1_job_postings


SELECT 
job_title_short,
job_location,
job_via,
job_posted_date :: date
FROM(
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings

WHERE
    salary_year_avg > 7000 AND 
    job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    ;


-- Remove the table


SELECT 
job_title_short,
job_location,
job_via,
job_posted_date :: date
FROM(
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings

WHERE
    salary_year_avg > 7000 AND 
    job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    ;

-- CTE


