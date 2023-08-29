--create role which should have admin access for masking
create role MASKINGADMIN
use role MASKINGADMIN;

--grant masking policy to the maskingadmin role
grant create masking policy on schema thebinarybananasdb.public to role MASKINGADMIN;
grant apply masking policy on account to role MASKINGADMIN;
grant role MASKINGADMIN to role DATAENGINEER;

--create tags
create tag CUSTOMER_ID;
create tag CREDIT_SCORE;
create tag PII;

--set tags to columns in table BANK_CHURN_MARKETING
alter table BANK_CHURN_MARKETING modify column CUSTOMER_ID set tag CUSTOMER_ID = 'high' ;
alter table BANK_CHURN_MARKETING modify column CREDIT_SCORE set tag CREDIT_SCORE = 'high' ;
alter table BANK_CHURN_MARKETING modify column CUSTOMER_ID set tag PII = 'high' ;
alter table BANK_CHURN_MARKETING modify column CREDIT_SCORE set tag PII = 'high' ;

--create masking poilcy
create or replace masking policy mask_customer_detail as
 (val integer) returns integer ->
 case
 when current_role() in ('DATAENGINEER') then val
 else -999999
 end;
 
--set masking to tags
alter tag CUSTOMER_ID set masking policy mask_customer_id;
alter tag CREDIT_SCORE set masking policy mask_customer_id;
