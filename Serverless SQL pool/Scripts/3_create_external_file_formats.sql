USE nyc_taxi_ldw;

-- CSV File format with parser version 2.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'csv_file_format')
CREATE EXTERNAL FILE FORMAT csv_file_format
WITH(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2,
        USE_TYPE_DEFAULT = FALSE,
        ENCODING = 'UTF8',
        PARSER_VERSION = '2.0')
    );

-- CSV File format with parser version 1.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'csv_file_format_pv1')
CREATE EXTERNAL FILE FORMAT csv_file_format_pv1
WITH(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2,
        USE_TYPE_DEFAULT = FALSE,
        ENCODING = 'UTF8',
        PARSER_VERSION = '1.0')
    );

-- TSV File format with parser version 2.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'tsv_file_format')
CREATE EXTERNAL FILE FORMAT tsv_file_format
WITH(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = '\t',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2,
        USE_TYPE_DEFAULT = FALSE,
        ENCODING = 'UTF8',
        PARSER_VERSION = '2.0')
    );

-- TSV File format with parser version 1.0
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'tsv_file_format_pv1')
    CREATE EXTERNAL FILE FORMAT tsv_file_format_pv1
    WITH (
        FORMAT_TYPE = DELIMITEDTEXT,
        FORMAT_OPTIONS ( 
            FIELD_TERMINATOR = '\t',
            STRING_DELIMITER = '"',
            FIRST_ROW = 2,
            USE_TYPE_DEFAULT = FALSE,
            ENCODING = 'UTF8',
            PARSER_VERSION = '1.0'
        )
    );

-- Create file format for Parquet
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'parquet_file_format')
CREATE EXTERNAL FILE FORMAT parquet_file_format
WITH (
    FORMAT_TYPE = PARQUET,
    -- Необходимо указать компрессор, если исходные данные подверглись компрессии
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

-- Create file format for Delta
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'delta_file_format')
CREATE EXTERNAL FILE FORMAT delta_file_format
WITH (
    FORMAT_TYPE = DELTA,
    -- Необходимо указать компрессор, если исходные данные подверглись компрессии
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);