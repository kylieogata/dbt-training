{{
    config(
        materialized='table'
    )
}}
select 
-- from raw orders
o.orderdate,
o.shipdate,
o.orderid,
o.shipmode,
o.ordersellingprice - o.ordercost as orderprofit,
o.ordercost,
o.ordersellingprice,
-- from raw customer
c.customername,
c.segment,
c.country,
-- from raw product
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c ON o.customerid = c.customerid
left join {{ ref('raw_product') }} as p ON o.productid = p.productid