CREATE DATABASE pizzahut;
SELECT * from pizzas;
SELECT * from order_details;
SELECT * from orders;
SELECT * from pizza_types;
-- Retrieve the total number of orders placed.
select count(order_id) from orders;

-- Calculate the total revenue generated from pizza sales.
-- revanue=price * quantity sold
select 
round(sum(order_details.quantity* pizzas.price),2) as total_revanue
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id

-- Identify the highest-priced pizza.
select 
pizza_types.name,pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price DESC limit 1 ;

-- Identify the most common pizza size ordered. 
select 
pizzas.size , sum(order_details.quantity) as total_quan
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by total_quan desc limit 1;

-- List the top 5 most ordered pizza types along with their quantities.
select sum(order_details.quantity) as quantity,
pizza_types.name
from pizzas
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name 
order by quantity desc limit 2;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select sum(order_details.quantity) as quantity,
pizza_types.category
from pizzas
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category 
order by quantity desc limit 2;

-- Determine the distribution of orders by hour of the day.
select hour(orders.time) as totalHRS,
count(order_id) as total
from orders
group by totalHRS
order by total desc limit 5;

-- Join relevant tables to find the category-wise distribution of pizzas.

