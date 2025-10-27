-- ===============================================================================
-- POSTGRESQL ACE AND PARTNER RELATIONSHIPS SCHEMA CREATION 
-- ===============================================================================
CREATE SCHEMA IF NOT EXISTS aces_and_partner_rships;
SET search_path TO aces_and_partner_rships, public;

-- ============================================================================
-- Table creation, data insert and queries for Odds Ratios of Partner-Reported ACE Categories One Year Postpartum When Mothers Had the Same Experience.
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