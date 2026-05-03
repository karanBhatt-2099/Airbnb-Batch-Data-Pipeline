{{ config(materialized='incremental') }}

{% set incremental_col = 'CREATED_AT' %}

SELECT *
FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
WHERE {{ incremental_col }} > (
    SELECT COALESCE(
        MAX({{ incremental_col }}),
        '1990-01-01'
    )
    FROM {{ this }}
)
{% endif %}