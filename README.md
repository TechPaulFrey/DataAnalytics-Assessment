Cowrywise Data Analytics SQL Assessment (Adebayo Paul)
DB:Cowrywise Adashi

This repo contains my SQL solutions using the follwoing tools MySql Server, Vscode with SQL extensions and Git and Gihub for version control


Assessment Q1: Multi-Product High-Value Customers(Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.)
Goal: This is aimed at identifying users who have:
- At least 1 funded savings plan
- At least 1 funded investment plan
- Total deposit amounts

--------------------------------------------------------------------------------------------------------------------------------------------------

Assessment Q2: Transaction Frequency Categorization (Calculate the average number of transactions per customer per month and categorize them)
Goal: This is to classify users into frequency bands:
- High Frequency (≥ 10/month)
- Medium (3–9/month)
- Low (≤ 2/month)

--------------------------------------------------------------------------------------------------------------------------------------------------

Assessment Q3: Account Inactivity Alert
Goal: This is to flag users with a savings or investment product but no deposits in over 365 days.

--------------------------------------------------------------------------------------------------------------------------------------------------

Assessment Q4: Customer Lifetime Value (CLV)
Goal: This is to estimate annualized CLV using:
- Transactions
- Tenure
- (Avg. deposit value × 0.1%)
Note:
- CLV was calculated for all registered users, regardless of whether they had made any transactions. 
Reason for this is because:
- Assessment Q4 task indicated CLV estimation for each user, which implies full user inclusion.
- Including users with zero transactions highlights dormant or inactive accounts.
- Additionally zero-value users are important for business decisions such as re-engagement campaigns.
- Users with no transactions will naturally have NULL average profits and NULL CLV.
- This output accurately models customer segmentation by contribution value.


---------------------------------------------------------------------------------------------------------------------------------------------------

File Structure requested and followed


├── Assessment_Q1.sql
├── Assessment_Q2.sql
├── Assessment_Q3.sql
├── Assessment_Q4.sql
├── README.md
