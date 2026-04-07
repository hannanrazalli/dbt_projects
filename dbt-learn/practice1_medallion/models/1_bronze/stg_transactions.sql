-- models/1_bronze/stg_transactions.sql

WITH source AS (
    -- dbt guna ref() untuk tarik data dari seed 'raw_transactions'
    SELECT * FROM {{ ref('raw_transactions') }}
)

SELECT
    txn_id,
    cust_id,
    amount,
    points,
    is_member,
    status,
    -- Convert string ke timestamp dlm Postgres guna ::timestamp
    txn_date::timestamp AS txn_timestamp,
    
    -- Audit Columns (Macam logic Spark kau)
    CURRENT_TIMESTAMP AS _ingest_at,
    '{{ invocation_id }}' AS _batch_id_bronze, -- dbt ganti batch_id Spark dngn invocation_id
    
    -- Logic CLEAN vs CORRUPT (macam is_corrupt dlm Spark kau)
    CASE 
        WHEN amount IS NULL OR points IS NULL THEN 'CORRUPT'
        ELSE 'CLEAN'
    END AS _record_status

FROM source