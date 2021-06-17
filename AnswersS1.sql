--Question1--
select CNAME,CLASTNAME,PNAME,PBRAND,PRICE*AmountofPurchase as TotalPrice,PurchaseDate,PurchasTime from test.customer inner join test.orders 
on customer.idCustomer = orders.CID
inner join test.product on product.PID = orders.PID

--Question 2--
select * from customer natural join orders;

select * from customer inner join orders on customer.idCustomer = orders.CID; 

--Question 3--
select * from product natural join orders;

select * from product join orders on orders.PID = product.PID;

--Question 4---
select * from test.product left join test.orders on
orders.PID = product.PID
order by product.PID;

--Question 5--
select * from test.customer left join test.orders on
orders.CID = customer.idCustomer
order by orders.CID;

--Question 6--
select CNAME,CLASTNAME from customer where idCustomer in
(select orders.CID
from orders natural join product
group by orders.CID
having sum(orders.AmountofPurchase*product.PRICE)>100
order by orders.CID)