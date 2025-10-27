-- ===============================================================================
-- POSTGRESQL ACE AND PARTNER RELATIONSHIPS SCHEMA CREATION 
-- ===============================================================================
CREATE SCHEMA IF NOT EXISTS aces_and_partner_rships;
SET search_path TO aces_and_partner_rships, public;

-- ============================================================================
-- Table creation, data insert and queries for Odds Ratios of Partner-Reported ACE Categories One Year Postpartum When Mothers Had the Same Experience.
-- Source: "Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 3.
-------------------------------------------------------------------------------

CREATE TABLE ace_pair_associations (
    id SERIAL PRIMARY KEY,
    ace_category VARCHAR(50),
    crude_odds_ratio NUMERIC(10,3),
    adjusted_odds_ratio NUMERIC(10,3),
    ci_low NUMERIC(10,3),
    ci_high NUMERIC(10,3),
    p_value NUMERIC(6,4)
);

INSERT INTO ace_pair_associations
(ace_category, crude_odds_ratio, adjusted_odds_ratio, ci_low, ci_high, p_value)
VALUES
('sexual_abuse', 23.13, 15.16, 3.80, 60.50, 0.001),
('emotional_abuse', 5.80, 4.12, 1.47, 11.51, 0.007),
('domestic_violence', 3.00, 2.46, 1.08, 5.60, 0.032),
('domestic_substance_abuse', 2.42, 2.12, 1.34, 3.35, 0.001),
('physical_abuse', 2.13, 2.02, 1.40, 2.94, 0.001),
('parental_separation', 1.81, 1.67, 1.18, 2.36, 0.004),
('domestic_mental_illness', 1.57, 1.47, 0.88, 2.45, 0.145),
('physical_neglect', 2.13, 2.19, 0.76, 6.32, 0.146);
