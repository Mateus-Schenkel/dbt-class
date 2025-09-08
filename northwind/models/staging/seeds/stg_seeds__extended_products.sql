with renamed as (
    SELECT
        product_id as ID,
        product_name as "name",
        quantity_per_unit as "quantity per unit",
        unit_price as "units price",
        units_in_stock as "units in stock",
        category_id as "category ID",
        updated_at
    FROM
        {{ref('raw_seeds__extended_products')}}
)

SELECT * FROM renamed