{{
    config(
        materialized='incremental',
        unique_key='BOOKING_ID'
    )
}}

SELECT
    BOOKING_ID,
    BOOKING_DATE,
    LISTING_ID,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} TOTAL_AMOUNT,
    SERVICE_FEE,
    CLEANING_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM {{ ref('bronze_bookings') }}