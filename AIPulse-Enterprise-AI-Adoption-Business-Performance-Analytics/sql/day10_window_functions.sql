use aipulse;

/* Task 2, you need to use Window Functions on survey_year and company_founding_year.

our dataset contains:

survey_year
company_founding_year
annual_revenue_usd_millions
ai_adoption_rate
company_id
*/


/*1. Running Total by Survey Year

Business Insight: How has cumulative revenue grown over survey years? */

SELECT
    survey_year,
    annual_revenue_usd_millions,
    SUM(annual_revenue_usd_millions)
        OVER(ORDER BY survey_year) AS running_total_revenue
FROM ai_company_adoption;
/* 2. Rank Companies by AI Adoption Rate 

Business Insight: Which companies have the highest AI adoption? */

SELECT
    company_id,
    company_founding_year,
    ai_adoption_rate,
    RANK() OVER(
        ORDER BY ai_adoption_rate DESC
    ) AS ai_rank
FROM ai_company_adoption;

/*3. Dense Rank by Revenue */
SELECT
    company_id,
    annual_revenue_usd_millions,
    DENSE_RANK() OVER(
        ORDER BY annual_revenue_usd_millions DESC
    ) AS revenue_rank
FROM ai_company_adoption;
/* 4. Previous Year's AI Adoption (LAG)

Business Insight: Compare AI adoption with the previous survey year. */

SELECT
    survey_year,
    ai_adoption_rate,
    LAG(ai_adoption_rate)
    OVER(ORDER BY survey_year) AS previous_year_ai
FROM ai_company_adoption;

/* 5. Next Year's AI Adoption (LEAD) */
SELECT
    survey_year,
    ai_adoption_rate,
    LEAD(ai_adoption_rate)
    OVER(ORDER BY survey_year) AS next_year_ai
FROM ai_company_adoption;

/* 6. Company Age Ranking 
Business Insight: Rank companies based on founding year. */

SELECT
    company_id,
    company_founding_year,
    RANK() OVER(
        ORDER BY company_founding_year
    ) AS company_age_rank
FROM ai_company_adoption;