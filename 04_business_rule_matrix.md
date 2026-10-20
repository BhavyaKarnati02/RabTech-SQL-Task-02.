# RabTech Task 02 — Business Rule-to-Constraint Matrix

**Database:** `RabTech_Task02`  
**Engine used:** Microsoft SQL Server Express. The supplied starter was PostgreSQL-compatible; these scripts are adapted for SQL Server.

| # | Business rule | Database implementation | Test evidence |
|---|---|---|---|
| 1 | Every customer has a unique ID. | `customers.customer_id` PRIMARY KEY | Duplicate customer ID test in `03_negative_tests.sql` |
| 2 | Every order has a unique ID. | `orders.order_id` PRIMARY KEY | Duplicate order ID test in `03_negative_tests.sql` |
| 3 | Every order belongs to an existing customer. | `orders.customer_id` is NOT NULL and a FOREIGN KEY to `customers.customer_id` | Nonexistent customer test |
| 4 | Status must be `PLACED`, `PAID`, or `CANCELLED`. | CHECK constraint on `order_status`; column is NOT NULL | Invalid `SHIPPED` status test |
| 5 | Order amount cannot be negative. | CHECK `amount_inr >= 0`; column is NOT NULL | Negative amount test |

## Additional integrity rules
- Customer name, city, and joined date are required.
- Order date, status, and amount are required.
- `NUMERIC(10,2)` stores amounts to two decimal places.

## Relationship and cardinality
One customer may have zero, one, or many orders. Each order belongs to exactly one existing customer.

## Retention
The starter requirements do not specify a retention period, deletion policy, or audit requirements. Retention is therefore unspecified and requires clarification from the business owner. No period has been invented.

## Transaction boundary
A single order insert is atomic: all constraints must pass or the insert is rejected. Larger workflows, such as creating an order and processing payment, need additional business requirements to define their transaction boundary.

## Scope
Only `customers` and `orders` are modeled because no product or payment entity was specified in the supplied starter.
