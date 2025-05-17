-- Adebayo Paul __ Assessment_Q2.sql (transaction frequency)-

WITH transaction_summary AS (
    SELECT
        owner_id,
        COUNT(*) AS total_transactions,
        PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM MAX(transaction_date)), EXTRACT(YEAR_MONTH FROM MIN(transaction_date))) + 1 AS active_months
    FROM savings_savingsaccount
    GROUP BY owner_id
),
customer_frequency AS (
    SELECT
        owner_id,
        ROUND(total_transactions / active_months, 2) AS avg_transactions_per_month,
        CASE
            WHEN ROUND(total_transactions / active_months, 2) >= 10 THEN 'High Frequency'
            WHEN ROUND(total_transactions / active_months, 2) BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_cat
    FROM transaction_summary
    WHERE active_months > 0
)
SELECT
    frequency_cat,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 2) AS avg_transactions_per_month
FROM customer_frequency
GROUP BY frequency_cat
ORDER BY avg_transactions_per_month DESC;