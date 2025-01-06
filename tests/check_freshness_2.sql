SELECT *
FROM {{ source("data360", "jira")}}
WHERE (
    SELECT MAX(created_date)
    FROM {{ source("data360", "jira")}}
) > date_add('day', -1, current_date)