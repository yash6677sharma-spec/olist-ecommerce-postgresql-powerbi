-- Basic data-quality checks. These queries only read data.

SELECT 'olist_customers_dataset' AS table_name, COUNT(*) AS row_count FROM olist_customers_dataset
UNION ALL
SELECT 'olist_geolocation_dataset', COUNT(*) FROM olist_geolocation_dataset
UNION ALL
SELECT 'olist_products_dataset', COUNT(*) FROM olist_products_dataset
UNION ALL
SELECT 'olist_sellers_dataset', COUNT(*) FROM olist_sellers_dataset
UNION ALL
SELECT 'olist_orders_dataset', COUNT(*) FROM olist_orders_dataset
UNION ALL
SELECT 'olist_order_items_dataset', COUNT(*) FROM olist_order_items_dataset
UNION ALL
SELECT 'olist_order_payments_dataset', COUNT(*) FROM olist_order_payments_dataset
UNION ALL
SELECT 'olist_order_reviews_dataset', COUNT(*) FROM olist_order_reviews_dataset
UNION ALL
SELECT 'product_category_name_translation', COUNT(*) FROM product_category_name_translation;

-- Orders whose customer_id has no matching customer.
SELECT COUNT(*) AS orphan_orders
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- Order items whose product_id has no matching product.
SELECT COUNT(*) AS orphan_order_items_products
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p ON p.product_id = oi.product_id
WHERE p.product_id IS NULL;

-- Order items whose seller_id has no matching seller.
SELECT COUNT(*) AS orphan_order_items_sellers
FROM olist_order_items_dataset oi
LEFT JOIN olist_sellers_dataset s ON s.seller_id = oi.seller_id
WHERE s.seller_id IS NULL;
