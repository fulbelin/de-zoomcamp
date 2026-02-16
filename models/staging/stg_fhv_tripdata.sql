{{ config(materialized='view') }}

SELECT 
    dispatching_base_num,
    pickup_datetime,
    dropOff_datetime as dropoff_datetime,
    PUlocationID as pickup_location_id,
    DOlocationID as dropoff_location_id,
    SR_Flag as shared_ride_flag,
    Affiliated_base_number as affiliated_base_number
FROM {{ source('nyc_taxi', 'fhv_2019') }}
WHERE dispatching_base_num IS NOT NULL