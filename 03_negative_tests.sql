USE RabTech_Task02;
GO
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO dbo.orders (order_id,customer_id,ordered_on,order_status,amount_inr)
 VALUES (901,1,'2026-11-02','SHIPPED',255.00);
 ROLLBACK TRANSACTION;
 PRINT 'FAIL: invalid status was accepted.';
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 PRINT 'PASS: invalid status rejected.';
 PRINT ERROR_MESSAGE();
END CATCH;
GO
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO dbo.orders (order_id,customer_id,ordered_on,order_status,amount_inr)
 VALUES (902,1,'2025-08-15','PAID',-67.00);
 ROLLBACK TRANSACTION;
 PRINT 'FAIL: negative amount was accepted.';
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 PRINT 'PASS: negative amount rejected.';
 PRINT ERROR_MESSAGE();
END CATCH;
GO
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO dbo.orders (order_id,customer_id,ordered_on,order_status,amount_inr)
 VALUES (903,999,'2006-03-25','PAID',78.00);
 ROLLBACK TRANSACTION;
 PRINT 'FAIL: nonexistent customer was accepted.';
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 PRINT 'PASS: nonexistent customer rejected.';
 PRINT ERROR_MESSAGE();
END CATCH;
GO
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO dbo.customers (customer_id,customer_name,city,joined_on)
 VALUES (1,'Duplicate Test','Test City','2026-01-01');
 ROLLBACK TRANSACTION;
 PRINT 'FAIL: duplicate customer ID was accepted.';
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 PRINT 'PASS: duplicate customer ID rejected.';
 PRINT ERROR_MESSAGE();
END CATCH;
GO
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO dbo.orders (order_id,customer_id,ordered_on,order_status,amount_inr)
 VALUES (101,1,'2026-11-02','PAID',10.00);
 ROLLBACK TRANSACTION;
 PRINT 'FAIL: duplicate order ID was accepted.';
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 PRINT 'PASS: duplicate order ID rejected.';
 PRINT ERROR_MESSAGE();
END CATCH;
GO
SELECT (SELECT COUNT(*) FROM dbo.customers) AS customer_count,
       (SELECT COUNT(*) FROM dbo.orders) AS order_count;
GO
