{% set congigs = [
    {
        "table" : "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns" : "SILVER_bookings.*",
        "alias" : "SILVER_bookings"
    },
    {
        "table" : "AIRBNB.SILVER.SILVER_LISTING",
        "columns" : "SILVER_listing.HOST_ID, SILVER_listing.ROOM_TYPE, SILVER_listing.CITY, SILVER_listing.COUNTRY, SILVER_listing.ACCOMMODATES, SILVER_listing.BEDROOMS, SILVER_listing.BATHROOMS, SILVER_listing.PRICE_PER_NIGHT, silver_listing.PRICE_PER_NIGHT_TAG, SILVER_listing.CREATED_AT AS LISTING_CREATED_AT",
        "alias" : "SILVER_listing",
        "join_condition" : "SILVER_bookings.listing_id = SILVER_listing.listing_id"
    },
    {
        "table" : "AIRBNB.SILVER.SILVER_HOSTS",
        "columns" : "SILVER_hosts.HOST_NAME, SILVER_hosts.HOST_SINCE, SILVER_hosts.IS_SUPERHOST, SILVER_hosts.RESPONSE_RATE, SILVER_hosts.RESPONSE_RATE_QUALITY, SILVER_hosts.CREATED_AT AS HOST_CREATED_AT",
        "alias" : "SILVER_hosts",
        "join_condition" : "SILVER_listing.host_id = SILVER_hosts.host_id"
    }
] %}



SELECT
    {% for config in congigs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for config in congigs %}
    {% if loop.first %}
    {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}