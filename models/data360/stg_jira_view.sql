{{ config(materialized='view') }}

select * from data360.stg_jira;