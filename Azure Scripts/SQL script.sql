CREATE DATABASE SCOPED CREDENTIAL cred_mahesh
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE silver_src
WITH (
    LOCATION = 'https://advworksdatalake.blob.core.windows.net/transformed-data-silver-level',
    CREDENTIAL = cred_mahesh
)

CREATE EXTERNAL DATA SOURCE gold_src
WITH (
    LOCATION = 'https://advworksdatalake.blob.core.windows.net/pipelined-data-gold-lvl',
    CREDENTIAL = cred_mahesh
)


CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)



-- CREATE EXTERNAL TABLES (CETAS)
CREATE EXTERNAL TABLE GoldLayer.ExtSales
WITH (
    LOCATION = 'ExternalSales',
    DATA_SOURCE = gold_src,
    FILE_FORMAT = parquet_format
) AS
SELECT * FROM GoldLayer.Sales


SELECT * FROM GoldLayer.ExtSales