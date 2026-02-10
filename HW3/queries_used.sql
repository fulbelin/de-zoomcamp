CREATE OR REPLACE EXTERNAL TABLE `de-zoomcamp-485821.zoomcamp.external_yellow_tripdata_2024`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://de-zoomcamp-485821/yellow_tripdata_2024-*.parquet']
);


CREATE OR REPLACE TABLE `de-zoomcamp-485821.zoomcamp.yellow_tripdata_2024`
AS
SELECT * FROM `de-zoomcamp-485821.zoomcamp.external_yellow_tripdata_2024`;


SELECT COUNT(*) FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata_2024`; # question 1


SELECT  #question 2
  'external' AS table_type,
  COUNT(DISTINCT PULocationID) AS distinct_pulocationids
FROM `de-zoomcamp-485821.zoomcamp.external_yellow_tripdata_2024`

UNION ALL

SELECT  #question 2
  'regular' AS table_type,
  COUNT(DISTINCT PULocationID) AS distinct_pulocationids
FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata_2024`;

SELECT # question 4
  COUNT(*) AS zero_fare_records
FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata_2024`
WHERE fare_amount = 0;

SELECT #question 6
  DISTINCT VendorID
FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata_2024`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';
