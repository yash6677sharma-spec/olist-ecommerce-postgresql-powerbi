# Architecture

## Data flow

```text
CSV files
   │
   ▼
PostgreSQL raw tables
   │
   ├── Primary keys
   ├── Foreign keys
   └── Indexes
   │
   ▼
BI views
   │
   ├── bi_dim_product
   ├── bi_fact_order
   ├── bi_fact_sales
   ├── bi_fact_review_latest
   └── bi_payments_order
   │
   ▼
Power BI
   │
   ▼
Interactive e-commerce analytics dashboard
```

## Layer responsibilities

### Raw layer
Stores the Olist CSV data in PostgreSQL tables with source-oriented column names.

### Relational layer
Foreign keys connect orders to customers, order items to orders/products/sellers, and payments/reviews to orders.

### Performance layer
Indexes are added to common join keys, customer state and purchase timestamps.

### BI layer
Views prepare reporting-friendly fields such as purchase month, delivery days, late-delivery flags, translated product categories and order-level payment aggregates.

### Reporting layer
Power BI connects to the PostgreSQL BI views and provides the dashboard/reporting experience.
