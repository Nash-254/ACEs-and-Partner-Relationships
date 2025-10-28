-- ===============================================================================
-- POSTGRESQL ACE AND PARTNER RELATIONSHIPS SCHEMA CREATION 
-- ===============================================================================
CREATE SCHEMA IF NOT EXISTS aces_and_partner_rships;
SET search_path TO aces_and_partner_rships, public;

-- ============================================================================
--1. Table creation, data insert and queries for Odds Ratios of Partner-Reported ACE Categories One Year Postpartum When Mothers Had the Same Experience.
-- Source: "Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 3.
-------------------------------------------------------------------------------

-- TABLE CREATION
CREATE TABLE aces_and_partner_rships.ace_pair_associations (
    id SERIAL PRIMARY KEY,
    ace_category VARCHAR(50),
    adjusted_odds_ratio NUMERIC(10,2),
    ci_low NUMERIC(10,2),
    ci_high NUMERIC(10,2),
    p_value NUMERIC(6,3)
);

-- DATA INSERTION
INSERT INTO aces_and_partner_rships.ace_pair_associations
(ace_category, adjusted_odds_ratio, ci_low, ci_high, p_value)
VALUES
('Sexual Abuse', 15.16, 3.80, 60.50, 0.001),
('Emotional Abuse', 4.12, 1.47, 11.51, 0.007),
('Domestic Violence', 2.46, 1.08, 5.60, 0.032),
('Domestic Substance Abuse', 2.12, 1.34, 3.35, 0.001),
('Physical Abuse', 2.02, 1.40, 2.94, 0.001),
('Physical Neglect', 2.19, 0.76, 6.32, 0.146),
('Parental Separation/Divorce', 1.67, 1.18, 2.36, 0.004),
('Domestic Mental Illness', 1.47, 0.88, 2.45, 0.145),
('Emotional Neglect', 1.50, 0.95, 2.35, 0.080);


-- VERIFY DATA INTEGRITY
SELECT * FROM aces_and_partner_rships.ace_pair_associations;

-- DATA QUERY ANALYSIS
-- Query to show Assortative Mating via Partner ACE Correlations
SELECT 
    ace_category,
    adjusted_odds_ratio AS aor_value,
    p_value
FROM aces_and_partner_rships.ace_pair_associations
ORDER BY adjusted_odds_ratio DESC;

----------------------------------------------------------------------------------
-- END of Table creation, data insert and queries for Odds Ratios of Partner-Reported ACE Categories One Year Postpartum When Mothers Had the Same Experience.
-- ===============================================================================



-- ================================================================================
--2. Table creation, data insert and queries for Proportions of outcome measures related to groups of couples with different numbers of ACE category exposure.
-- Source: "Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 4.
-- ================================================================================

-- TABLE CREATION
CREATE TABLE aces_and_partner_rships.relationship_outcomes (
    id SERIAL PRIMARY KEY,
    ace_group VARCHAR(20),
    low_education NUMERIC(5,1),
    low_income NUMERIC(5,1),
    bad_spousal_support NUMERIC(5,1),
    rshp_assess_score NUMERIC(5,1),
    bad_health NUMERIC(5,1),
    stress NUMERIC(5,1),
    anxiety NUMERIC(5,1),
    depression NUMERIC(5,1) 
);

-- DATA INSERTION
INSERT INTO aces_and_partner_rships.relationship_outcomes
(ace_group, low_education, low_income, bad_spousal_support, rshp_assess_score, bad_health, stress, anxiety, depression)
VALUES
('none', 19.0, 6.4, 5.1, 9.6, 5.2, 5.8, 0, 0),
('Both 0-3', 24.4, 10.6, 5.6, 9.8, 10.8, 8.0, 0.6, 0.6),
('Mother High', 28.2, 16.2, 9.5, 16.4, 14.9, 20.4, 2.7, 2.7),
('Partner High', 20.4, 16.4, 9.1, 18.2, 21.8, 20.4, 5.4, 1.8),
('Both High', 66.7, 33.3, 33.3, 26.7, 40.0, 60.0, 20.0, 13.3);

-- VERIFY DATA INTEGRITY
SELECT * FROM aces_and_partner_rships.relationship_outcomes;

-- DATA QUERY ANALYSIS
-- Query to show Proportions of outcome measures related to groups of couples with different numbers of ACE category exposure
SELECT
    ace_group,
    'Low Income' AS outcome, low_income AS value FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'Low Education', low_education FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'Bad Spousal Support', bad_spousal_support FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'Depression', depression FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'Anxiety', anxiety FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'High Stress', stress FROM aces_and_partner_rships.relationship_outcomes
UNION ALL
SELECT ace_group, 'Bad Health', bad_health FROM aces_and_partner_rships.relationship_outcomes
ORDER BY outcome, value DESC;

-------------------------------------------------------------------------------
-- END of Table creation, data insert and queries for Proportions of outcome measures related to groups of couples with different numbers of ACE category exposure.
-- ==========================================================================



-- ================================================================================
--3. Table creation, data insert and queries for multiple ordinal regression to determine the adjusted Odds Ratios (aOR) for various unfavorable outcomes based on ACE exposure groups, using couples with zero ACE exposure as the reference group.
-- Source: "Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 5.
-- ================================================================================
-- TABLE CREATION
CREATE TABLE aces_and_partner_rships.regression_results (
    outcome VARCHAR(50),
    ace_group VARCHAR(20),
    adjusted_odds_ratio NUMERIC(10,2),
    ci_low NUMERIC(10,2),
    ci_high NUMERIC(10,2)
);

-- DATA INSERTION
INSERT INTO aces_and_partner_rships.regression_results
(outcome, ace_group, adjusted_odds_ratio, ci_low, ci_high)
VALUES
('Low Education', 'Both High', 16.13, 3.30, 78.90),
('Low Income', 'Both High', 3.25, 0.77, 13.68),
('Bad Spousal Support', 'Both High', 9.39, 2.12, 41.72),
('R/ship Assess Score', 'Both High', 4.10, 0.98, 17.19),
('Bad Health', 'Both High', 14.73, 2.97, 73.17,
('High Stress', 'Both High', 11.78, 3.10, 44.72)
('Anxiety', 'Both High', 91.97, 13.38, 632.07),
('Depression', 'Both High', 17.42, 2.14, 141.78),
;