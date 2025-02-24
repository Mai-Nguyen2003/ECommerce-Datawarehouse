{% macro total_price(quantity, price, freight_value) %}
 ({{quantity}} * ( {{price}} + {{freight_value}} ))::decimal

{% endmacro %}