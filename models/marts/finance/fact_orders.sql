with orders as (

select * from {{ ref ('stg_jaffle_shop_orders') }}

),

payments as (

select * from {{ ref ('stg_stripe_payment')}}

),

final as (

select 
orders.order_id
,orders.customer_id
,orders.order_date
,payments.amount
from payments
inner join orders on orders.order_id = payments.order_id
)

select * from final