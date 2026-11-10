--10 produk terlaris berdasarkan jumlah order
SELECT
product_id,
COUNT (*) item_cnt
FROM bigquery-public-data.thelook_ecommerce.order_items
group by product_id
order by 2 desc
Limit 10;

--Jumlah customer masing-masing negara
SELECT 
country,
count (*) jumlah_cust
FROM bigquery-public-data.thelook_ecommerce.users
group by 1
order by 2 desc
limit 10;

-- membandingkan performa masing-masing status jumlah item, jumlah order, total sales, rata-rata sale price
select 
status,
count(*) jumlah_item,
count(distinct order_id) jumlah_order,
round(sum(sale_price), 2) total_sales,
round(avg(sale_price), 2) avr_sale_price
FROM bigquery-public-data.thelook_ecommerce.order_items
group by 1
order by 4 desc;

-- membandingkan jumlah order, sale_price, dan average transaksi
select 
user_id,
count(distinct order_id) jumlah_order,
round(sum(sale_price), 2) jumlah_sale_price,
round(sum(sale_price)/COUNT(DISTINCT order_id), 2) avr_transaksi
FROM bigquery-public-data.thelook_ecommerce.order_items
group by user_id
order by 3 desc
LIMIT 10;
