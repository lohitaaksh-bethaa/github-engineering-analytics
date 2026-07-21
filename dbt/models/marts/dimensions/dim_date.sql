{{ config(
    materialized='table'
) }}

WITH date_spine AS (

    SELECT
        DATEADD(
            DAY,
            ROW_NUMBER() OVER (ORDER BY SEQ4()) - 1,
            '2020-01-01'
        ) AS full_date
    FROM TABLE(GENERATOR(ROWCOUNT => 5000))

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['full_date']) }} as date_key,
    full_date,
    YEAR(full_date) AS year,
    QUARTER(full_date) AS quarter,
    CONCAT('Q', QUARTER(full_date)) AS quarter_name,
    MONTH(full_date) AS month,
    MONTHNAME(full_date) AS month_name,
    DAY(full_date) AS day,
    DAYOFWEEKISO(full_date) AS day_of_week,
    DAYNAME(full_date) AS day_name,
    WEEK(full_date) AS week_of_year,
    DAYOFYEAR(full_date) AS day_of_year,
    
    CASE
        WHEN DAYOFWEEKISO(full_date) IN (6,7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend,

    CASE
        WHEN DAY(full_date) = 1
        THEN TRUE
        ELSE FALSE
    END AS is_month_start,

    CASE
        WHEN full_date = LAST_DAY(full_date)
        THEN TRUE
        ELSE FALSE
    END AS is_month_end,

    CASE
        WHEN MONTH(full_date) IN (1,2,3)
        THEN 'Q1'
        WHEN MONTH(full_date) IN (4,5,6)
        THEN 'Q2'
        WHEN MONTH(full_date) IN (7,8,9)
        THEN 'Q3'
        ELSE 'Q4'
    END AS fiscal_quarter,

    CASE
        WHEN MONTH(full_date) >= 4
        THEN YEAR(full_date)
        ELSE YEAR(full_date) - 1
    END AS fiscal_year

FROM date_spine