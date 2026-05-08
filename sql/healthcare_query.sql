-- Meraj Nushin
-- SQL Healthcare Cost Analysis Queries

-- Average Billing Cost by Condition
-- Insight: Shows which medical conditions are most expensive.
SELECT "Medical Condition" as medical_condition, ROUND(AVG("Billing Amount"), 2) as average_cost
FROM healthcare_dataset
GROUP BY "Medical Condition"
ORDER BY average_cost DESC;

-- Top Conditions by Number of Patients
-- Insight: Identifies most common chronic conditions.
SELECT "Medical Condition" as medical_conditon, COUNT(name) AS total_patients
FROM healthcare_dataset
GROUP BY "Medical Condition"
ORDER BY total_patients DESC;

-- Readmission Rate Analysis
-- Insight: Measures overall readmission trends.
SELECT "Admission Type" as admission_type, COUNT(*) as patient_count
FROM healthcare_dataset
GROUP BY "Admission Type";

-- Average Cost for Readmitted Patients
-- Insight: Shows whether readmissions increase healthcare costs.
SELECT
    "Admission Type" as admission_type,
    ROUND(AVG("Billing Amount"), 2) AS average_cost
FROM healthcare_dataset
GROUP BY "Admission Type";

-- Highest Cost Departments
-- Insight: Identifies departments driving the most spending.
SELECT
    hospital,
    ROUND(SUM("Billing Amount"), 2) AS total_billing_cost
FROM healthcare_dataset
GROUP BY hospital
ORDER BY total_billing_cost DESC;

-- Age Group Analysis
-- Insight: Analyzes healthcare utilization by age group.
SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 55 THEN '36-55'
        ELSE '56+'
        END AS age_group,

    ROUND(AVG("Billing Amount"), 2) AS average_claim_cost,
    COUNT(*) AS total_patients
FROM healthcare_dataset
GROUP BY age_group
ORDER BY average_claim_cost DESC;

-- Emergency Admissions Analysis
-- Insight: Compares emergency/urgent/elective care costs.
SELECT
    "Admission Type" as admission_type,
    COUNT(*) AS total_admissions,
    ROUND(AVG("Billing Amount"), 2) AS average_cost
FROM healthcare_dataset
GROUP BY "Admission Type"
ORDER BY average_cost DESC;

-- Patients with Highest Costs
-- Insight: Identifies high-risk/high-cost patients.
SELECT
    "name" as name,
    "Medical Condition" as medical_condition,
    "Billing Amount" as billing_amount
FROM healthcare_dataset
ORDER BY "Billing Amount" DESC
LIMIT 10;