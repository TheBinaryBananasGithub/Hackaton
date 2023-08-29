{{
    config(
        schema="PUBLIC"
    )
}}

select AGE, avg(CREDIT_SCORE) as Average_Credit from BANK_MARKETING.BANKING_INSIGHTS.BANK_CHURN_CUSTOMERS group by AGE order by AGE