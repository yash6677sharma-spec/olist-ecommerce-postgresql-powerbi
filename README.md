# Olist E-Commerce Analytics — PostgreSQL × Power BI

A portfolio project for analyzing the Brazilian Olist e-commerce dataset using **PostgreSQL as the data layer** and **Power BI as the reporting layer**.

## Project Architecture

```text
Olist CSV datasets
        ↓
PostgreSQL raw tables
        ↓
Keys + indexes
        ↓
BI views
        ↓
Power BI
        ↓
Interactive dashboard
```

## Tech Stack

- PostgreSQL
- SQL
- Power BI
- CSV datasets

## Dataset Tables

The project works with these Olist datasets:

- Customers
- Geolocation
- Products
- Sellers
- Orders
- Order Items
- Order Payments
- Order Reviews
- Product Category Translation

## Repository Structure

```text
olist-ecommerce-postgresql-powerbi/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_foreign_keys.sql
│   ├── 03_indexes.sql
│   ├── 04_bi_views.sql
│   └── 05_data_quality_checks.sql
├── powerbi/
│   └── README.md
├── data/
│   └── README.md
└── docs/
    └── architecture.md
```

## PostgreSQL Setup

1. Create a PostgreSQL database.
2. Run `sql/01_create_tables.sql` to create the raw tables.
3. Import the Olist CSV files into the matching tables.
4. Run `sql/02_foreign_keys.sql` to add relationships.
5. Run `sql/03_indexes.sql` to improve common lookup and date-query performance.
6. Run `sql/04_bi_views.sql` to create the reporting layer.
7. Run `sql/05_data_quality_checks.sql` to inspect row counts and basic relationship quality.

The SQL files are deployment-oriented and keep the raw Olist tables separate from the BI views.

## Power BI

Power BI is intended to connect directly to PostgreSQL. The main reporting objects are:

- `bi_fact_sales`
- `bi_fact_order`
- `bi_dim_product`
- `bi_fact_review_latest`
- `bi_payments_order`

Open Power BI Desktop → **Get Data** → **PostgreSQL database**, connect to the same database, and select the BI views.

The Power BI report file is maintained separately because this repository workflow currently stores text source files. Do not commit database passwords, connection secrets, or local credentials.

## Important SQL Note

The uploaded BI-view source defined `bi_fact_sales` before `bi_payments_order`, even though `bi_fact_sales` references the payment aggregation view. In `sql/04_bi_views.sql`, the deployment order is arranged so `bi_payments_order` is created first. This is a deployment-order fix only; the underlying view logic is retained.

## Goal

The project demonstrates an end-to-end analytics workflow:

**Data → PostgreSQL → SQL data modeling → BI views → Power BI dashboard**

This structure is suitable for a beginner-to-intermediate Data Analyst portfolio project.
