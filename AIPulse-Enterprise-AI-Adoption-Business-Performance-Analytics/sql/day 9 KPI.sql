use aipulse;

--- KPI 1: Overall AI Adoption Rate
SELECT
ROUND(AVG(ai_adoption_rate),2) AS avg_ai_adoption_rate
FROM ai_company_adoption;

--- Purpose: Measures enterprise-wide AI adoption.

---  KPI 2: Overall AI Maturity Score
SELECT
ROUND(AVG(ai_maturity_score),2) AS avg_ai_maturity_score
FROM ai_company_adoption;

--- Purpose: Indicates how mature organizations are in AI implementation.

-- KPI 3: Productivity Improvement
SELECT
ROUND(AVG(productivity_change_percent),2) AS avg_productivity_change
FROM ai_company_adoption;

--- Purpose: Measures productivity gains after AI adoption.

--- KPI 4: Revenue Growth
SELECT
ROUND(AVG(revenue_growth_percent),2) AS avg_revenue_growth
FROM ai_company_adoption;

---  Purpose: Measures business growth after AI adoption.

--- KPI 5: Cost Reduction
SELECT
ROUND(AVG(cost_reduction_percent),2) AS avg_cost_reduction
FROM ai_company_adoption;

-- Purpose: Evaluates operational savings.

--- KPI 6: AI Budget Utilization
SELECT
ROUND(AVG(ai_budget_percentage),2) AS avg_ai_budget
FROM ai_company_adoption;

--- Purpose: Shows average investment in AI.

---- KPI 7: Innovation Score
SELECT
ROUND(AVG(innovation_score),2) AS avg_innovation_score
FROM ai_company_adoption;

--- Purpose: Measures innovation achieved through AI.

---  KPI 8: Customer Satisfaction
SELECT
ROUND(AVG(customer_satisfaction),2) AS avg_customer_satisfaction
FROM ai_company_adoption;

--- Purpose: Measures customer experience after AI implementation.

---- KPI 9: Jobs Created vs Jobs Displaced
SELECT
SUM(jobs_created) AS total_jobs_created,
SUM(jobs_displaced) AS total_jobs_displaced
FROM ai_company_adoption;

---- Purpose: Evaluates workforce impact of AI.

---- KPI 10: Region-wise AI Adoption
SELECT
region,
ROUND(AVG(ai_adoption_rate),2) AS avg_ai_adoption_rate
FROM ai_company_adoption
GROUP BY region
ORDER BY avg_ai_adoption_rate DESC;

---  Purpose: Identifies regions leading AI adoption.