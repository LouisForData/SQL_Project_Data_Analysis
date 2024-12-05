/*

Subqueries: query nested inside a larger Query

-- It can be used in SELECT, FROM, and WHERE clauses.
*/

SELECT * FROM(-- Subquery starts here

    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- subquery ends here

-- FOR CTE

/*
-- What is CTE: Define a temporary result set that you can reference 
- Can reference within a SELECT, INSERT, UPDATE, OR DELETE statement 
- Defined with WITH


*/

WITH january_jobs AS ( -- CTE definition starts here
SELECT *
FROM
     job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1


) -- CTE definition  ends here


SELECT * 
FROM january_jobs


-- Example of Subquery

SELECT 

    company_id,
    job_no_degree_mention
FROM 
    job_postings_fact
WHERE
    job_no_degree_mention = true;


-- We want the company name 



SELECT name AS Company_name

FROM company_dim;

---- Start the subquery 


 
-- Company ID

SELECT name AS Company_name,
company_id

FROM company_dim

WHERE company_id IN (

SELECT 

    company_id
FROM 
    job_postings_fact
WHERE
    job_no_degree_mention = true
)


-- Order by


-- Company ID

SELECT name AS Company_name,
company_id,
link

FROM company_dim

WHERE company_id IN (

SELECT 

    company_id
FROM 
    job_postings_fact
WHERE
    job_no_degree_mention = true

ORDER BY
    company_id
)

---

/*
SELECT 
    company_dim.name AS Company_name,
    (
        SELECT job_no_degree_mention
        FROM job_postings_fact
        WHERE job_postings_fact.company_id = company_dim.company_id
        AND job_postings_fact.job_no_degree_mention = true
        LIMIT 1
    ) AS job_no_degree_mention
FROM 
    company_dim
WHERE
    company_dim.company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = true
    );
*/


-- CTE

/*

Find the companies that have the most job openings.
-Get the total number of job posting per company Id(job_posting_fact)
- Return the total number of jobs with the company name (company_dim)


*/
SELECT 
    company_id,
    name AS Company_name 
FROm company_dim;


SELECT 
    company_id
FROM
    job_postings_fact;

-- Step 2:

SELECT 
    company_id,
    count(*)
FROM
    job_postings_fact
GROUP BY
     company_id
;

-- Step 3

WITH company_job_count AS(
    SELECT 
        company_id,
        count(*)
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT *
FROM company_job_count;


-- Step 4

WITH company_job_count AS(
    SELECT 
        company_id,
        count(*)
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT name 
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id;

-- Step 5

WITH company_job_count AS(
    SELECT 
        company_id,
        count(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id;

-- Step 6 

-- using ORDER BY


SELECT name 
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id;

-- Step 5

WITH company_job_count AS(
    SELECT 
        company_id,
        count(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC
;

