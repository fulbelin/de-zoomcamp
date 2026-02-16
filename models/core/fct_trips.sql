/*
    Fact table combining Yellow and Green taxi trips
    Materialized as table for performance
*/

{{ config(materialized='table') }}

WITH yellow_trips AS (
    SELECT 
        'Yellow' as service_type,
        VendorID,
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        passenger_count,
        trip_distance,
        RatecodeID,
        store_and_fwd_flag,
        PULocationID,
        DOLocationID,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge
    FROM {{ ref('stg_yellow_tripdata') }}
),

green_trips AS (
    SELECT 
        'Green' as service_type,
        VendorID,
        lpep_pickup_datetime as pickup_datetime,
        lpep_dropoff_datetime as dropoff_datetime,
        passenger_count,
        trip_distance,
        RatecodeID,
        store_and_fwd_flag,
        PULocationID,
        DOLocationID,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge
    FROM {{ ref('stg_green_tripdata') }}
)

SELECT * FROM yellow_trips
UNION ALL
SELECT * FROM green_trips