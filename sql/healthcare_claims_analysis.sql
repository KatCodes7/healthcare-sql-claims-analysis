-- Healthcare Claims SQL Analysis
-- Author: Rachelle-Marie Tisdale
-- Description: SQL analysis of Medicare beneficiary data

DROP TABLE IF EXISTS raw_claims;
DROP TABLE IF EXISTS beneficiary_analysis;

.mode csv
.import ProviderFraud.csv raw_claims

CREATE TABLE beneficiary_analysis AS
SELECT
    BeneID,
    DOB,
    CAST(Gender AS INTEGER) AS Gender,
    CAST(Race AS INTEGER) AS Race,
    CAST(RenalDiseaseIndicator AS INTEGER) AS RenalDiseaseIndicator,
    CAST(State AS INTEGER) AS State,
    CAST(County AS INTEGER) AS County,
    CAST(ChronicCond_Alzheimer AS INTEGER) AS ChronicCond_Alzheimer,
    CAST(ChronicCond_Heartfailure AS INTEGER) AS ChronicCond_Heartfailure,
    CAST(ChronicCond_KidneyDisease AS INTEGER) AS ChronicCond_KidneyDisease,
    CAST(ChronicCond_Cancer AS INTEGER) AS ChronicCond_Cancer,
    CAST(ChronicCond_ObstrPulmonary AS INTEGER) AS ChronicCond_ObstrPulmonary,
    CAST(ChronicCond_Depression AS INTEGER) AS ChronicCond_Depression,
    CAST(ChronicCond_Diabetes AS INTEGER) AS ChronicCond_Diabetes,
    CAST(ChronicCond_IschemicHeart AS INTEGER) AS ChronicCond_IschemicHeart,
    CAST(ChronicCond_Osteoporasis AS INTEGER) AS ChronicCond_Osteoporasis,
    CAST(ChronicCond_rheumatoidarthritis AS INTEGER) AS ChronicCond_rheumatoidarthritis,
    CAST(ChronicCond_stroke AS INTEGER) AS ChronicCond_stroke,
    CAST(IPAnnualReimbursementAmt AS INTEGER) AS IPAnnualReimbursementAmt,
    CAST(IPAnnualDeductibleAmt AS INTEGER) AS IPAnnualDeductibleAmt,
    CAST(OPAnnualReimbursementAmt AS INTEGER) AS OPAnnualReimbursementAmt,
    CAST(OPAnnualDeductibleAmt AS INTEGER) AS OPAnnualDeductibleAmt,
    CAST(Patient_Age_Year AS INTEGER) AS Patient_Age_Year,
    CAST(Patient_Age_Month AS INTEGER) AS Patient_Age_Month,
    CAST(Dead_or_Alive AS INTEGER) AS Dead_or_Alive,
    CAST(AGE AS REAL) AS AGE,
    AGE_groups
FROM raw_claims;

-- Population distribution
SELECT AGE_groups, COUNT(*) AS total
FROM beneficiary_analysis
GROUP BY AGE_groups
ORDER BY total DESC;

-- Cost trends by age
SELECT
    AGE_groups,
    ROUND(AVG(IPAnnualReimbursementAmt), 2) AS avg_ip,
    ROUND(AVG(OPAnnualReimbursementAmt), 2) AS avg_op
FROM beneficiary_analysis
GROUP BY AGE_groups
ORDER BY avg_ip DESC;

-- Diabetes impact
SELECT
    CASE
        WHEN ChronicCond_Diabetes = 1 THEN 'Diabetes'
        ELSE 'No Diabetes'
    END AS diabetes_group,
    ROUND(AVG(IPAnnualReimbursementAmt), 2) AS avg_ip,
    ROUND(AVG(OPAnnualReimbursementAmt), 2) AS avg_op
FROM beneficiary_analysis
GROUP BY diabetes_group;

-- High-cost beneficiaries
SELECT
    BeneID,
    AGE,
    AGE_groups,
    IPAnnualReimbursementAmt,
    OPAnnualReimbursementAmt,
    IPAnnualReimbursementAmt + OPAnnualReimbursementAmt AS total_reimbursement
FROM beneficiary_analysis
ORDER BY total_reimbursement DESC
LIMIT 10;
