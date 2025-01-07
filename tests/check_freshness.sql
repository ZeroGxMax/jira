{# SELECT
    CASE
        -- IF there is a row that have created_date is today or yesterday then test passed
        WHEN MAX(created_date) > date_add('day', 1, current_date) THEN NULL
        -- else test failed
        ELSE 1
    END AS is_recent
FROM {{ref('jira')}} #}

-- The test passes if there is at least one row with a created_date of today or yesterday.
SELECT *
FROM {{ source("data360", "stg_jira")}}
WHERE (
    SELECT MAX(created_date)
    FROM {{ source("data360", "stg_jira")}}
) > date_add('day', -1, current_date)
