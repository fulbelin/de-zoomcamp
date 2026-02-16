{{ config(materialized='table') }}

SELECT 
    DATE_TRUNC(pickup_datetime, MONTH) as revenue_month,
    PULocationID as zone_id,
    service_type,
    
    -- Revenue metrics
    SUM(total_amount) as revenue_monthly_total,
    COUNT(*) as total_monthly_trips,
    AVG(total_amount) as avg_monthly_fare,
    AVG(trip_distance) as avg_monthly_trip_distance
    
FROM {{ ref('fct_trips') }}
GROUP BY 1, 2, 3