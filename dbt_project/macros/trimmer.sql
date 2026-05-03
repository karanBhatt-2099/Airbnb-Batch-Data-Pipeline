{% macro trimmer(column_name, node) %}
    {{ col_name | trim | UPPER }}
{% endmacro %}