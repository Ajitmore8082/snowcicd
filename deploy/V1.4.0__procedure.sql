
use DATABASE DEV_DB;

CREATE SCHEMA IF NOT EXISTS DEV_DB.proce;

create or replace procedure proce.Load_data_from_stages()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
BEGIN
 COPY INTO EMP
 FROM @S3_STAGE
 FILE_FORMAT=CSV_FORMAT;

  RETURN 'Success: Loaded data from stage to raw layer. File count = ' || v_file_count;
END;
$$;