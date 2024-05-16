Use BikeStores

Select sales.orders.order_id, CONCAT(sales.customers.first_name,' ',sales.customers.last_name) AS 'customer_name',
 sales.customers.city, sales.customers.state, sales.orders.order_date,
SUM(sales.order_items.quantity) AS 'total_units',
SUM(sales.order_items.quantity * sales.order_items.list_price) AS 'revenue',
products.product_name, production.categories.category_name, 
sales.stores.store_name, 
CONCAT(sales.staffs.first_name,' ',sales.staffs.last_name) AS 'staff_name'
From sales.orders JOIN sales.customers ON sales.orders.customer_id = sales.customers.customer_id
JOIN sales.order_items ON sales.orders.order_id = sales.order_items.order_id
JOIN production.products ON sales.order_items.product_id =production.products.product_id
JOIN production.categories ON production.products.category_id = production.categories.category_id
JOIN sales.stores ON sales.orders.store_id = sales.stores.store_id
JOIN sales.staffs ON sales.orders.staff_id = sales.staffs.staff_id
GROUP BY sales.orders.order_id, CONCAT(sales.customers.first_name,' ',sales.customers.last_name),
 sales.customers.city, sales.orders.order_date,
 sales.customers.state, products.product_name, 
 production.categories.category_name,
 sales.stores.store_name,
 CONCAT(sales.staffs.first_name,' ',sales.staffs.last_name)