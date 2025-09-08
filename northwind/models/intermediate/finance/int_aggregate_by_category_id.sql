with kpi as (
        select
            "category ID",
            ID,
            name,
            "units price",
            "units in stock",
            ("units price" * "units in stock") as "inventory value",
            avg("units price") over (partition by "category ID") as "avg price by category",
            case
                when sum("units in stock") over (partition by "category ID") = 0
                then 0
                else ("units in stock" * 1.0 / sum("units in stock") over (partition by "category ID"))
            end as "stock share"
        from {{ref("stg_seeds__extended_products")}}
    )

select * from kpi