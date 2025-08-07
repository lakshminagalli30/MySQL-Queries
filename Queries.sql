select product_id,name,price+100
from product;
select product_id,name,price-200
from product;
select product_id,name,price-price*(25/100) as "discount of 25%"
from product;
select product_id,name,price+price*(5/100) as "increasing 25%"
from product;
select price,price-price*(5/100) as "Discounted price"
from product;
use company;
select * from employee;
select e_id,e_fname,e_lname,salary*12 as "Annual Salary"
from employee;
select e_id,e_fname,e_lname,salary*6 as "Half yearly salary"
from employee;
select salary,salary*6"Half yearly salary"
from employee;
use myntra;
select * from product;
select product_id,name,price 
from product
where price>500;
select product_id,name,price-price*(25/100) as "Discount 25%"
from product
where price>500;
select * 
from product
where brand<>"clothing";
select *
from product 
where brand="Roaster" or brand="Puma";
select product_id,name,price-price*(25/100)
from product
where price>500 and brand="Puma";
select * 
from product
where price between 144 and 3858;
select *
from product
where brand="Puma" and price between 479 and 3484;
select distinct brand 
from product;
select name,brand,product_id
from product
where product_id not between 5 and 10;
select name,brand,price 
from product
where brand in("adidas","Levis","nike");
select name,brand,price
from product
where brand not in("adidas","levis","nike");
select * from orders;
select *
from orders
where status is not null;
select * from user;
select * from user where firstname like "i%";
select * from user where lastname like "%a";
select name,description from product where name like "%T-Shirt%";
select name,description from product where name like "%T-shirt%" and description like "%Cotton%";
select user_id,firstname from user where firstname like "i%i";
select * from orders;
select * from orders where total_amount like "_5%";
select * from user where lastname like "%t__";
select * from user where firstname regexp "^[aeiouAEIOU]";
select * from user where firstname regexp "^A";
select * from user where lastname regexp "[aeiouAEIOU]$";
select * from user where firstname not regexp "^[aeiouAEIOU]";
select phone_number from user where phone_number regexp "[6-9][0-9]{9}";
select email from user where email regexp "[a-z0-9]+@[a-z]+/.[a-z]{2,3}";
select name from product where name regexp "^..a";
select name from product where name regexp "^..[aeiouAEIOU]";
select name from product where name not regexp "^..[aeiouAEIOU]";
select name from product where name regexp "[aeiouAEIOU]{2}";
select upper(firstname),lower(lastname) from user;
select concat(firstname,lastname)as fullname from user;
select substr(name,6,3) from product where name="Slim Fit Jeans";
select instr(description,"s") from product;
select trim(leading "A" from firstname),lastname
from user
where firstname Like "A%";
select product_id,round(price)
from product;
select product_id,truncate(price,-3)
from product;
select day(order_date),month(order_date),year(order_date)
from orders
where order_id>6;
select extract(minute from order_date),extract(second from order_date)
from orders
where order_id>5;
select name,brand,price,
case
when brand="puma" then price-price*(25/100)
when brand="Nike" then price-price*(15/100)
else price-price*(10/100)
end as "Discounted price"
from product;
select name,price,
if(price>500,"Price is above 500","price is 500 or below") as "Price status"
from product;
select user_id,email,ifnull(phone_number,"No phone number") as "phone number"
from user;
select order_id,if(status="Delivered","order is completed","order is pending") as "order status"
from orders;
select order_id,ifnull(status,"Status is not updated") as "order status"
from orders;
select order_id,nullif(status,"Delivered") as "order status"
from orders;
select order_id,total_amount,isnull(status) as "Status"
from orders;
select price,dense_rank()
over(order by price desc) as "Dense Rank"
from product;
select product_id,name,category,price,dense_rank()
over(partition by category order by price desc) as "dense rank"
from product;
select count(product_id)
from product 
where brand="arrow";
select count(product_id),sum(price)
from product
where brand="puma";
select min(price),max(price)
from product
where brand="Arrow";
select avg(price)
from product
where brand="Puma";
use company;
select * from employee;
select distinct salary
from employee
order by salary desc
limit 1;
select distinct salary
from employee
order by salary desc
limit 2 offset 2;
select distinct salary
from employee
order by salary asc
limit 2;
use myntra;
select brand,min(price)
from product
group by brand;
select brand,min(price),max(price)
from product
group by brand;
select brand,count(product_id)
from product
group by brand;
select category,min(price),max(price),avg(price)
from product
group by category;
select user_id,sum(total_amount)
from orders
where status="Shipped"
group by user_id;
select brand,name,min(price),max(price),count(product_id)
from product
where product_id>5
group by brand;
select * from product;
select brand,max(price)
from product
where product_id>=10
group by brand
having max(price)<3000;
select * 
from product
where price=
(select max(price) 
from product);
