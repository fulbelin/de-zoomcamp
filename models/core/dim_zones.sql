{{ config(materialized='table') }}

SELECT 
    LocationID,
    Borough,
    Zone,
    service_zone
FROM {{ ref('taxi_zone_lookup') }}