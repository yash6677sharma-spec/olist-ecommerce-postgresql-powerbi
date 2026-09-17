# Data

Place the Olist CSV datasets in this folder when working with the project locally.

Expected datasets:

- `olist_customers_dataset.csv`
- `olist_geolocation_dataset.csv`
- `olist_products_dataset.csv`
- `olist_sellers_dataset.csv`
- `olist_orders_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `product_category_name_translation.csv`

Import each CSV into the PostgreSQL table with the corresponding name. The repository does not require database credentials, and large raw datasets can remain outside GitHub while the SQL and reporting layer stay version controlled.
