create or replace view hotels.table_joined as
with hotel_cte as(
select * from hotels.hotel_data_2018
union
select * from hotels.hotel_data_2019
union
select * from hotels.hotel_data_2020
)
select * from hotel_cte
left join hotels.market_segment
on hotel_cte.market_segment = market_segment.market_segment_desc
left join hotels.meal_cost
on meal_cost.meal_desc = hotel_cte.meal