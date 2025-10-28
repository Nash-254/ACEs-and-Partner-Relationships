CREATE OR REPLACE VIEW aces_and_partner_rships.relationship_outcomes_long AS
  SELECT ace_group, 'Low Income' AS outcome, low_income AS value FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'Low Education', low_education FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'Bad Spousal Support', bad_spousal_support FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'Depression', depression FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'Anxiety', anxiety FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'High Stress', stress FROM aces_and_partner_rships.relationship_outcomes_long
  UNION ALL SELECT ace_group, 'Bad Health', bad_health FROM aces_and_partner_rships.relationship_outcomes_long;



CREATE OR REPLACE VIEW aces_and_partner_rships.ace_to_group_edges_2 AS
SELECT
  a.ace_category AS source,
  g.ace_group    AS target,
  ROUND(a.adjusted_odds_ratio *
        CASE g.ace_group
          WHEN 'none' THEN 0.5
          WHEN '0-3_both' THEN 1.0
          WHEN 'mother_high' THEN 2.0
          WHEN 'partner_high' THEN 2.0
          WHEN 'both_high' THEN 3.0
        END , 2) AS weight
FROM aces_and_partner_rships.ace_pair_associations a
CROSS JOIN (SELECT DISTINCT ace_group FROM aces_and_partner_rships.ace_group FROM aces_and_partner_rships.relationship_outcomes_long) g;


CREATE OR REPLACE VIEW aces_and_partner_rships.group_to_outcome_edges_2 AS
SELECT
  ace_group AS source,
  outcome   AS target,
  value     AS weight
FROM relationship_outcomes_long;


CREATE OR REPLACE VIEW aces_and_partner_rships.ace_group_outcome_flow_2 AS
SELECT source, target, weight, 'ace_to_group' AS edge_type
FROM aces_and_partner_rships.ace_to_group_edges_2
UNION ALL
SELECT source, target, weight, 'group_to_outcome' AS edge_type
FROM aces_and_partner_rships.group_to_outcome_edges_2;



SELECT * FROM aces_and_partner_rships.ace_group_outcome_flow_2
ORDER BY edge_type, weight DESC;





