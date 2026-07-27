CREATE DATABASE IF NOT EXISTS aipulse;

USE aipulse;

CREATE TABLE ai_company_adoption (
response_id INT PRIMARY KEY,
company_id VARCHAR(20),
survey_year INT,
quarter VARCHAR(10),
country VARCHAR(100),
region VARCHAR(100),
industry VARCHAR(100),
company_size VARCHAR(50),
num_employees INT,
annual_revenue_usd_millions DECIMAL(10,2),
company_founding_year INT,
company_age INT,
company_age_group VARCHAR(30),
ai_adoption_rate DECIMAL(5,2),
ai_adoption_stage VARCHAR(50),
years_using_ai INT,
ai_primary_tool VARCHAR(100),
num_ai_tools_used INT,
ai_use_case VARCHAR(150),
ai_projects_active INT,
ai_training_hours DECIMAL(10,2),
ai_budget_percentage DECIMAL(5,2),
ai_maturity_score DECIMAL(5,3),
ai_failure_rate DECIMAL(5,2),
ai_investment_per_employee DECIMAL(10,2),
regulatory_compliance_score INT,
data_privacy_level VARCHAR(50),
ai_ethics_committee VARCHAR(20),
ai_risk_management_score INT,
remote_work_percentage DECIMAL(5,2),
employee_satisfaction_score DECIMAL(5,2),
task_automation_rate DECIMAL(5,2),
time_saved_per_week DECIMAL(5,2),
productivity_change_percent DECIMAL(5,2),
jobs_displaced INT,
jobs_created INT,
reskilled_employees INT,
revenue_growth_percent DECIMAL(5,2),
cost_reduction_percent DECIMAL(5,2),
innovation_score INT,
customer_satisfaction DECIMAL(5,2),
survey_source VARCHAR(100),
data_collection_method VARCHAR(100)
);


select count(*) from ai_company_adoption; 
truncate table ai_company_adoption;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT @@secure_file_priv;  

TRUNCATE TABLE ai_company_adoption;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ai_company_adoption(4).csv'
INTO TABLE ai_company_adoption
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE TABLE ai_company_adoption;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ai_company_adoption.csv'
INTO TABLE ai_company_adoption
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;   


SELECT COUNT(*) FROM ai_company_adoption;  


/* second dataset import */


DROP TABLE IF EXISTS ai_industry_summary;  

CREATE TABLE ai_industry_summary (
    industry VARCHAR(100),
    avg_ai_adoption_rate DECIMAL(10,2),
    avg_productivity_change_percent DECIMAL(10,2),
    avg_ai_maturity_score DECIMAL(10,4),
    avg_ai_failure_rate DECIMAL(10,2),
    avg_jobs_displaced DECIMAL(10,2),
    avg_jobs_created DECIMAL(10,2),
    avg_customer_satisfaction DECIMAL(10,2)
);  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ai_industry_summary.csv'
INTO TABLE ai_industry_summary
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;  


SELECT COUNT(*) FROM ai_industry_summary; 


/** third dataset import */

DROP TABLE IF EXISTS country_ai_index;

CREATE TABLE country_ai_index (
    country VARCHAR(100),
    region VARCHAR(100),
    gdp_per_capita DECIMAL(12,2),
    internet_penetration DECIMAL(5,2),
    digital_maturity_index DECIMAL(5,2),
    country_ai_policy VARCHAR(50),
    ai_patent_filings_2024 INT,
    ai_researchers_per_million DECIMAL(10,2) 
);  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/country_ai_index.csv'
INTO TABLE country_ai_index
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;  


SELECT COUNT(*) FROM country_ai_index;  


SHOW TABLES;   
SHOW CREATE TABLE ai_company_adoption;  
SHOW INDEX FROM ai_company_adoption;

DESCRIBE ai_company_adoption;   


ALTER TABLE ai_company_adoption
ADD PRIMARY KEY (response_id);  


CREATE INDEX idx_company_id
ON ai_company_adoption(company_id(20));   

SHOW INDEX FROM ai_company_adoption;  



/* task 2 */

 --- Check for NULL values 

SELECT
SUM(response_id IS NULL) AS response_id_nulls,
SUM(company_id IS NULL) AS company_id_nulls,
SUM(country IS NULL) AS country_nulls,
SUM(region IS NULL) AS region_nulls,
SUM(industry IS NULL) AS industry_nulls
FROM ai_company_adoption;  


-- duplicate values

SELECT response_id,
COUNT(*) AS duplicate_count
FROM ai_company_adoption
GROUP BY response_id
HAVING COUNT(*) > 1;   


--- Check whitespace

SELECT
COUNT(*) AS whitespace_rows
FROM ai_company_adoption
WHERE company_id<>TRIM(company_id)
OR country<>TRIM(country)
OR region<>TRIM(region)
OR industry<>TRIM(industry);  


DESCRIBE ai_company_adoption;  

-- Validate row count

SELECT COUNT(*) AS total_rows
FROM ai_company_adoption;  


SELECT
CAST(ai_adoption_rate AS DECIMAL(5,2)) AS adoption_rate
FROM ai_company_adoption
LIMIT 5;