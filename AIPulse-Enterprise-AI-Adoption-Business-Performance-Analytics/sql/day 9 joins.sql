USE aipulse;

SHOW TABLES;

DESCRIBE ai_company_adoption;

DESCRIBE ai_industry_summary;  


DESCRIBE country_ai_index;  


/* task 1 Write JOINs across ai_industry_summary.csv and ai_company_adoption.csv and country_ai_index.csv */

SELECT *
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
ON a.industry = i.industry
INNER JOIN country_ai_index c
ON a.country = c.country;   

/* 1. AI Adoption by Industry with Country Digital Maturity   */
SELECT
    a.company_id,
    a.country,
    a.industry,
    a.ai_adoption_rate,
    i.avg_ai_adoption_rate,
    c.digital_maturity_index
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
    ON a.industry = i.industry
INNER JOIN country_ai_index c
    ON a.country = c.country;  
    
/* Insight: Compare a company's AI adoption with the average adoption in its industry and the country's digital maturity */


/* 2. High AI Adoption Companies */
SELECT
    a.company_id,
    a.country,
    a.industry,
    a.ai_adoption_rate,
    c.country_ai_policy
FROM ai_company_adoption a
INNER JOIN country_ai_index c
    ON a.country = c.country
WHERE a.ai_adoption_rate > 80;

/* Insight: Identify companies with high AI adoption and examine their country's AI policy. */

/* 3. Industry Performance Comparison  */
SELECT
    a.company_id,
    a.industry,
    a.productivity_change_percent,
    i.avg_productivity_change_percent
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
    ON a.industry = i.industry;

/* Insight: Compare each company's productivity improvement with the industry average. */

/* 4. Companies in Digitally Mature Countries */
SELECT
    a.company_id,
    a.country,
    c.digital_maturity_index,
    a.ai_maturity_score
FROM ai_company_adoption a
INNER JOIN country_ai_index c
    ON a.country = c.country
WHERE c.digital_maturity_index > 80;

/* Insight: Find companies operating in countries with high digital maturity. */

/* 5. Complete Business View (All Three Tables) */
SELECT
    a.company_id,
    a.country,
    a.industry,
    a.ai_adoption_rate,
    a.productivity_change_percent,
    i.avg_ai_adoption_rate,
    i.avg_productivity_change_percent,
    c.gdp_per_capita,
    c.digital_maturity_index
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
    ON a.industry = i.industry
INNER JOIN country_ai_index c
    ON a.country = c.country;  
    
   