



SELECT COUNT(*) 
FROM `de-zoomcamp-485821.zoomcamp.green_tripdata`
WHERE tpep_pickup_datetime >= '2020-01-01' 
  AND tpep_pickup_datetime < '2021-01-01';

SELECT COUNT(*) 
FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata`
WHERE tpep_pickup_datetime >= '2020-01-01' 
  AND tpep_pickup_datetime < '2021-01-01';

SELECT COUNT(*) 
FROM `de-zoomcamp-485821.zoomcamp.yellow_tripdata`
WHERE tpep_pickup_datetime >= '2021-03-01' 
  AND tpep_pickup_datetime < '2021-03-31';