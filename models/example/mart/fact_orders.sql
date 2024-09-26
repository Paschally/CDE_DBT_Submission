{{ config(
    materialized='table'
) }}

select
    o.order_id,
    c.c_name as customer,
    m.menu_name as meal,
    d.d_name as dining_style, -- Use alias 'd' for dining table
    o.order_date,
    o.quantity,
    m.m_price
    
from 
    {{ ref('stg_orders') }} o
join 
    {{ ref('stg_customers') }} c on o.customer_id = c.c_id
join
    {{ ref('stg_dining') }} d on o.dining_id = d.d_id
join
    {{ ref('stg_menu') }} m on o.menu_id = m.m_id