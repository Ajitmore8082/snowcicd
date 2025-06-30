use DEV_DB;

CREATE OR REPLACE FILE FORMAT DEV_DB.BRONZE_SC.CSV_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER=1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'DEV_DBDEV_DB.BRONZE_SC
NULL_IF = ('NULL', 'null')
ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE;

create storage integration S3_int;
    type = external_stage
    storage_provider = s3
    storage_aws_role_arn = 'arn:aws:iam::060795923566:role/SF_Role'
    enabled = true
    storage_allowed_locations = ( 's3://snowflakes3bucket8082/csv/' )
    -- storage_blocked_locations = ( 's3://<location1>', 's3://<location2>' )
    -- comment = '<comment>'
    ;

   CREATE OR REPLACE STAGE DEV_DB.BRONZE_SC.S3_STAGE
   FILE_FORMAT= DEV_DB.BRONZE_SC.CSV_FORMAT
   Storage_integration=S3_int
   URL='s3://snowflakes3bucket8082/csv/';