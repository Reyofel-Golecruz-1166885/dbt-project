with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (
    select * from {{ ref('stg_stripe__payments') }}
    where status = 'success'
)

select 
    orders.order_id,
    orders.customer_id,
    payments.amount

from orders
left join payments on orders.order_id = payments.orderid