use aipulse;

 
    /* task 2 Query 1 — Group by Region */
    SELECT
    a.region,
    AVG(i.avg_ai_adoption_rate) AS avg_ai_adoption_rate,
    AVG(i.avg_productivity_change_percent) AS avg_productivity_change_percent,
    AVG(i.avg_ai_maturity_score) AS avg_ai_maturity_score
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
ON a.industry = i.industry
GROUP BY a.region;   



/* Query 2 — Group by Survey Source */
SELECT
    a.survey_source,
    AVG(i.avg_ai_adoption_rate) AS avg_ai_adoption_rate,
    AVG(i.avg_productivity_change_percent) AS avg_productivity_change_percent,
    AVG(i.avg_ai_maturity_score) AS avg_ai_maturity_score
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
ON a.industry = i.industry
GROUP BY a.survey_source;  


/* Query 3 — Group by Region and Survey Source */


SELECT
    a.region,
    a.survey_source,
    AVG(i.avg_ai_adoption_rate) AS avg_ai_adoption_rate,
    AVG(i.avg_productivity_change_percent) AS avg_productivity_change_percent,
    AVG(i.avg_ai_maturity_score) AS avg_ai_maturity_score
FROM ai_company_adoption a
INNER JOIN ai_industry_summary i
ON a.industry = i.industry
GROUP BY
    a.region,
    a.survey_source
ORDER BY
    a.region,
    a.survey_source;