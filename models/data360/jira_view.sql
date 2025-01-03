{{ config(materialized='view') }}

select * from data360.jira;