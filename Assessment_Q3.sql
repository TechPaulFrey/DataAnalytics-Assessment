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
        pt.id AS plan_id,
        CASE 
            WHEN pp.is_regular_savings = 1 THEN 'Savings'
            WHEN pp.is_a_fund = 1 THEN 'Investment'
            ELSE 'Other'
        END AS plan_type
    FROM users_customuser u
    INNER JOIN plans_plan pp ON uc.id = pp.owner_id
    WHERE pp.is_regular_savings = 1 OR pp.is_a_fund = 1
),
inactivity_check AS (
    SELECT
        a.customer_id,
        a.name,
        a.plan_id,
        a.plan_type,
        l.last_transaction_date,
        DATEDIFF(CURDATE(), l.last_transaction_date) AS inactivity_days
    FROM active_customers a
    LEFT JOIN latest_transactions l ON a.customer_id = l.owner_id
)
SELECT *
FROM inactivity_check
WHERE inactivity_days > 365
ORDER BY inactivity_days DESC;
