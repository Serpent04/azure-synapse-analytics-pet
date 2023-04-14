USE nyc_taxi_ldw;
GO

DROP VIEW IF EXISTS silver.vw_trip_data_green;
GO

CREATE VIEW silver.vw_trip_data_green
AS
SELECT *,
green_trip_data.filepath(1) AS year,
green_trip_data.filepath(2) as month
FROM
OPENROWSET(
    BULK 'silver/trip_data_green/year=*/month=*/*.parquet',
    DATA_SOURCE = 'nyc_taxi_src',
    FORMAT = 'PARQUET'
)
AS green_trip_data;