{{ config(
    materialized='incremental',
    unique_key='ID'
) }}

select
    *
from {{ ref("stg_seeds__extended_products") }}

{% if is_incremental() %}

where updated_at > (
    select max(updated_at)
    from {{ this }}
)
{% endif %}
