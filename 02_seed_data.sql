USE RabTech_Task02;
GO
INSERT INTO dbo.customers (customer_id, customer_name, city, joined_on)
SELECT v.customer_id, v.customer_name, v.city, v.joined_on
FROM (VALUES
 (1, 'Aarav Mehta', 'Chennai', CONVERT(date,'2026-01-03')),
 (2, 'Diya Nair', 'Kochi', CONVERT(date,'2026-01-10')),
 (3, 'Kabir Shah', 'Pune', CONVERT(date,'2026-02-02')),
 (4, 'Meera Iyer', 'Bengaluru', CONVERT(date,'2026-02-15'))
) AS v(customer_id, customer_name, city, joined_on)
WHERE NOT EXISTS (SELECT 1 FROM dbo.customers c WHERE c.customer_id=v.customer_id);
GO
INSERT INTO dbo.orders (order_id, customer_id, ordered_on, order_status, amount_inr)
SELECT v.order_id, v.customer_id, v.ordered_on, v.order_status, v.amount_inr
FROM (VALUES
 (101,1,CONVERT(date,'2026-03-01'),'PAID',CONVERT(numeric(10,2),1499.00)),
 (102,1,CONVERT(date,'2026-03-17'),'CANCELLED',CONVERT(numeric(10,2),799.00)),
 (103,2,CONVERT(date,'2026-03-05'),'PAID',CONVERT(numeric(10,2),2499.00)),
 (104,3,CONVERT(date,'2026-04-02'),'PLACED',CONVERT(numeric(10,2),999.00)),
 (105,4,CONVERT(date,'2026-04-06'),'PAID',CONVERT(numeric(10,2),1899.00)),
 (106,2,CONVERT(date,'2026-04-08'),'PAID',CONVERT(numeric(10,2),599.00))
) AS v(order_id, customer_id, ordered_on, order_status, amount_inr)
WHERE NOT EXISTS (SELECT 1 FROM dbo.orders o WHERE o.order_id=v.order_id);
GO
SELECT * FROM dbo.customers ORDER BY customer_id;
SELECT * FROM dbo.orders ORDER BY order_id;
SELECT (SELECT COUNT(*) FROM dbo.customers) AS customer_count,
       (SELECT COUNT(*) FROM dbo.orders) AS order_count;
GO
