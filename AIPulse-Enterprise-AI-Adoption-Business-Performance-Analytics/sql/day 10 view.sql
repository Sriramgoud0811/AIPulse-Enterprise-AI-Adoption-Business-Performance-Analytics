use aipulse;
show tables;
DROP VIEW IF EXISTS vw_ai_adoption_industry; 

DESCRIBE ai_company_adoption; 


USE aipulse;

DROP VIEW IF EXISTS vw_ai_adoption_industry;

CREATE VIEW vw_ai_adoption_industry AS
SELECT
    industry,
    ROUND(AVG(ai_adoption_rate),2) AS avg_ai_adoption_rate
FROM ai_company_adoption
GROUP BY industry;  

SELECT * FROM vw_ai_adoption_industry;  


/*  View 2 – AI Maturity by Industry */

CREATE VIEW vw_ai_maturity AS
SELECT
    industry,
    ROUND(AVG(ai_maturity_score),2) AS avg_ai_maturity_score
FROM ai_company_adoption
GROUP BY industry;

SELECT * FROM vw_ai_maturity;  


/* 4. AI Investment by Industry */
---- Business Insight: Which industries invest the most in AI?

CREATE VIEW vw_ai_investment AS
SELECT
    industry,
    ROUND(AVG(ai_investment_per_employee),2) AS avg_ai_investment
FROM ai_company_adoption
GROUP BY industry;

SELECT * FROM vw_ai_investment;  


/* view 4  AI Training Hours by Region */

--- Business Insight: Which regions invest the most in employee AI training?

CREATE VIEW vw_ai_training AS
SELECT
    region,
    ROUND(AVG(ai_training_hours),2) AS avg_training_hours
FROM ai_company_adoption
GROUP BY region;

SELECT * FROM vw_ai_training; 

/* AI Automation vs Productivity */

----  Business Insight: Does higher automation correspond to higher productivity?

CREATE VIEW vw_automation_productivity AS
SELECT
    industry,
    ROUND(AVG(task_automation_rate),2) AS avg_automation_rate,
    ROUND(AVG(productivity_change_percent),2) AS avg_productivity
FROM ai_company_adoption
GROUP BY industry;

SELECT * FROM vw_automation_productivity;  


/*  AI Failure Rate by Industry

Business Question: Which industries experience the highest AI implementation failure rates? */

CREATE VIEW vw_ai_failure_rate AS
SELECT
    industry,
    ROUND(AVG(ai_failure_rate),2) AS avg_failure_rate
FROM ai_company_adoption
GROUP BY industry;

SELECT * FROM vw_ai_failure_rate;  


/* AI Projects Active by Region

Business Question: Which regions are running the highest number of AI projects? */

CREATE VIEW vw_ai_projects AS
SELECT
    region,
    ROUND(AVG(ai_projects_active),2) AS avg_ai_projects
FROM ai_company_adoption
GROUP BY region;

SELECT * FROM vw_ai_projects;



/* Employee Satisfaction after AI Adoption

Business Question: Which industries maintain the highest employee satisfaction after adopting AI? */

CREATE VIEW vw_employee_satisfaction AS
SELECT
    industry,
    ROUND(AVG(employee_satisfaction_score),2) AS avg_employee_satisfaction
FROM ai_company_adoption
GROUP BY industry;

SELECT * FROM vw_employee_satisfaction;

