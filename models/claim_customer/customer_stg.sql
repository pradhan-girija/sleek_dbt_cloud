SELECT CAST(ROUND(CUSTOMER_ID, 0) AS INT) AS customer_id,
        -- TO_DATE(NULLIF(DATE_OF_BIRTH, '01-01-1900'), 'DD-MM-YYYY') AS DOB,
        DATE_OF_BIRTH as DOB,
        BOROUGH,NEIGHBORHOOD,ZIP_CODE,NAME AS customer_name,
        current_timestamp as dbt_updated_at

        from {{source('landing','customers')}} 
       
       
