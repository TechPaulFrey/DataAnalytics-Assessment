-- Assessment_Q3.sql (Adebayo Paul) Identify customers with inactive accounts for over 365 days--

WITH latest_transactions AS (
    SELECT
        owner_id,
        MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    GROUP BY owner_id
),
active_customers AS (
    SELECT
        uc.id AS customer_id,
        CONCAT(uc.first_name, ' ', uc.last_name) AS name,
        pp.id AS plan_id,
        CASE 
            WHEN pp.is_regular_savings = 1 THEN 'Savings'
            WHEN pp.is_a_fund = 1 THEN 'Investment'
            ELSE 'Other'
        END AS plan_type
    FROM users_customuser uc
    INNER JOIN plans_plan pp ON uc.id = pp.owner_id
    WHERE pp.is_regular_savings = 1 OR pp.is_a_fund = 1
),
inactivity_check AS (
    SELECT
        ac.customer_id,
        ac.name,
        ac.plan_id,
        ac.plan_type,
        lt.last_transaction_date,
        DATEDIFF(CURDATE(), lt.last_transaction_date) AS inactivity_days
    FROM active_customers ac
    LEFT JOIN latest_transactions lt ON ac.customer_id = lt.owner_id
)
SELECT *
FROM inactivity_check
WHERE inactivity_days > 365
ORDER BY inactivity_days DESC;
