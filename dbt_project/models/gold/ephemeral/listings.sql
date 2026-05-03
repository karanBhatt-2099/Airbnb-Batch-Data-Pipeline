{{
    config(
        materialized='ephemeral'
    )
}}

WITH listings AS (

    SELECT
        LISTING_ID,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM {{ ref('OBT') }}

)

SELECT *
FROM listings