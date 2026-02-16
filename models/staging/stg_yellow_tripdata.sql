/*
    Staging model for Yellow Taxi trips
    Filters for 2019-2020 data and cleans invalid records
*/
 
{{ config(materialized='view') }}

SELECT 
    VendorID,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
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
FROM {{ source('nyc_taxi', 'yellow_tripdata') }}
WHERE EXTRACT(YEAR FROM tpep_pickup_datetime) BETWEEN 2019 AND 2020
    AND EXTRACT(YEAR FROM tpep_dropoff_datetime) BETWEEN 2019 AND 2020
    AND tpep_dropoff_datetime > tpep_pickup_datetime