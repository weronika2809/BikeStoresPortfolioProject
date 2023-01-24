use BikeStores

select 
	so.order_id,
	CONCAT(sc.first_name, ' ', sc.last_name) as Customer,
	sc.city,
	sc.state,
	so.order_date,
	sum(soi.quantity) as 'total_units',
	sum(soi.quantity*soi.list_price) as 'revenue',
	pp.product_name,
	pc.category_name,
	ss.store_name,
	CONCAT(sst.first_name, ' ', sst.last_name) as 'sales_rep'
from sales.orders so
join sales.customers sc
on so.customer_id=sc.customer_id
join sales.order_items soi
on so.order_id=soi.order_id
join production.products pp
on soi.product_id=pp.product_id
join production.categories pc
on pp.category_id=pc.category_id
join sales.stores ss
on so.store_id=ss.store_id
join sales.staffs sst
on so.staff_id=sst.staff_id
group by  
	so.order_id,
	CONCAT(sc.first_name, ' ', sc.last_name),
	sc.city,
	sc.state,
	so.order_date,
	pp.product_name,
	pc.category_name,
	ss.store_name,
	CONCAT(sst.first_name, ' ', sst.last_name) 