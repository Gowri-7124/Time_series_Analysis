

select table_schema,table_name
from information_schema.tables
where table_name='sales';

--sales in Jan-2022

select sum(sales) as total_jan_sales
from public.sales
where date between '2022-01-01' and '2022-01-31'

--highest sale month

select 
  extract(YEAR from date)as year,
  extract(MONTH from date)as month,
  sum(sales) as total_sales
from public.sales
group by
	extract(YEAR from date),
    extract(MONTH from date)
order by total_sales desc
limit 1;

--lowest selling month
select 
  extract(YEAR from date)as year,
  extract(MONTH from date)as month,
  sum(sales) as total_sales
from public.sales
group by
	extract(YEAR from date),
    extract(MONTH from date)
order by total_sales asc
limit 1;

---when does promo was used.

select date,promo,sales
from public.sales
where promo='1'
order by date;

--on which month promo used the most

select 
	to_char(date_trunc('month',date),'YYYY-MM')as month,
	count(promo) as promo_use
from public.sales
where promo is not null
	and promo <> 0
group by date_trunc('month',date)
order by promo_use desc
limit 1;

---sales in december of 2023

select sum(sales) as total_dec_sales
from public.sales
where date between '2023-12-01' and '2023-12-31'

--promo used least

select 
	to_char(date_trunc('month',date),'YYYY-MM')as month,
	count(promo) as promo_use
from public.sales
where promo is not null
	and promo <> 1
group by date_trunc('month',date)
order by promo_use desc
limit 1;

--holiday and sale
select date,holiday,sales
from public.sales
where holiday='1'
order by date;

---the highest sale in a holiday
select date,Max(sales) as highest_sales,holiday
from public.sales
where holiday=1
group by date,holiday
order by highest_sales desc
limit 1;

--the highest sale in a regular day
select date,Max(sales) as highest_sales,holiday
from public.sales
where holiday=0
group by date,holiday
order by highest_sales desc
limit 1;


--promo used when it is a holiday.
select date,sales,promo,holiday
from public.sales
where promo=1 and holiday=1
order by sales desc

--highest amount when promo used

select date,Max(sales) as highest_sales,promo,holiday
from public.sales
where holiday=1 and promo=1
group by date,holiday,promo
order by highest_sales desc
limit 1;

	

