{{
    config(
        schema="PUBLIC"
    )
}}

select GEOGRAPHY, avg(CREDIT_SCORE) as Average_Credit from BANK_MARKETING.BANKING_INSIGHTS.BANK_CHURN_CUSTOMERS group by GEOGRAPHY