/*
RabTech Task 02 schema adapted for Microsoft SQL Server Express.
Safe to run in the existing database: existing tables are not dropped.
*/
USE RabTech_Task02;
GO
IF OBJECT_ID(N'dbo.customers', N'U') IS NULL
BEGIN
 CREATE TABLE dbo.customers (
  customer_id INTEGER NOT NULL CONSTRAINT PK_customers PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  city VARCHAR(80) NOT NULL,
  joined_on DATE NOT NULL
 );
END;
GO
IF OBJECT_ID(N'dbo.orders', N'U') IS NULL
BEGIN
 CREATE TABLE dbo.orders (
  order_id INTEGER NOT NULL CONSTRAINT PK_orders PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  ordered_on DATE NOT NULL,
  order_status VARCHAR(20) NOT NULL,
  amount_inr NUMERIC(10,2) NOT NULL,
  CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES dbo.customers(customer_id),
  CONSTRAINT CK_orders_order_status CHECK (order_status IN ('PLACED', 'PAID', 'CANCELLED')),
  CONSTRAINT CK_orders_amount_nonnegative CHECK (amount_inr >= 0)
 );
END;
GO
