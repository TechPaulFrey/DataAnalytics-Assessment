-- Assessment_Q4.sql (Adebayo Paul) Customer Lifetime Value (CLV)--

WITH user_stats AS (
    SELECT
        uc.id AS customer_id,
        CONCAT(uc.first_name, ' ', uc.last_name) AS name,
        TIMESTAMPDIFF(MONTH, uc.date_joined, CURDATE()) AS tenure_months,
        COUNT(sa.id) AS total_transactions,
        ROUND(AVG(sa.confirmed_amount)/100 * 0.001, 2) AS avg_profit_per_transaction
    FROM users_customuser uc
    LEFT JOIN savings_savingsaccount sa ON uc.id = sa.owner_id
    GROUP BY uc.id, uc.first_name, uc.last_name, uc.date_joined
),
customer_life_value AS (
    SELECT
        customer_id,
        name,
        tenure_months,
        total_transactions,
        avg_profit_per_transaction,
        ROUND((total_transactions / tenure_months) * 12 * avg_profit_per_transaction, 2) AS estimated_clv
    FROM user_stats
   
)
SELECT *
FROM customer_life_value
ORDER BY estimated_clv DESC;
