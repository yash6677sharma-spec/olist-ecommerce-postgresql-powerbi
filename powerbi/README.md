# Power BI

The Power BI report is designed to use PostgreSQL as its database source.

## PostgreSQL objects for Power BI

Use these reporting views when loading the model:

- `bi_fact_sales` — item-level sales, customer, seller, product, payment and review fields
- `bi_fact_order` — order dates, delivery duration, late-delivery flag and customer geography
- `bi_dim_product` — product category and dimensions
- `bi_fact_review_latest` — latest review record per order
- `bi_payments_order` — payment values and installments aggregated to order level

## Connect

In Power BI Desktop:

1. Select **Get Data**.
2. Select **PostgreSQL database**.
3. Enter the PostgreSQL server and database used for this project.
4. Select the BI views above.
5. Load or transform the data in Power Query.
6. Build/refresh the dashboard.

Keep passwords, local server details and other credentials out of GitHub.

## Report file

The existing local report file is `ecom.pbix`. It should be uploaded to the repository manually if you want the binary Power BI file stored on GitHub; the connected GitHub file workflow used for this build writes text source files.
