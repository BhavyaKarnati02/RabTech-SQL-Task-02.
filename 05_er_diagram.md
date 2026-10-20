# RabTech Task 02 — ER Diagram

Paste the Mermaid block into a Mermaid-compatible Markdown viewer or Mermaid Live Editor to render it.

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    CUSTOMERS {
        int customer_id PK
        varchar customer_name
        varchar city
        date joined_on
    }
    ORDERS {
        int order_id PK
        int customer_id FK
        date ordered_on
        varchar order_status
        numeric amount_inr
    }
```

`CUSTOMERS ||--o{ ORDERS` means one customer can have zero or many orders, while every order belongs to exactly one customer.
