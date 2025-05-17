SELECT
    uc.id AS owner_id,
    CONCAT(uc.first_name, ' ', uc.last_name) AS name,
    COUNT(DISTINCT CASE WHEN pp.is_regular_savings = 1 THEN pp.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN pp.is_a_fund = 1 THEN pp.id END) AS investment_count,
    ROUND(SUM(sa.confirmed_amount) / 100, 2) AS total_deposits
FROM users_customuser uc
LEFT JOIN plans_plan pp ON uc.id = pp.owner_id
LEFT JOIN savings_savingsaccount sa ON uc.id = sa.owner_id
WHERE pp.is_regular_savings = 1 OR pp.is_a_fund = 1
GROUP BY uc.id, name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;
