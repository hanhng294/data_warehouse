with dim_customer__source as (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.sales__customers`
)
, dim_customer__rename_column as (
  SELECT
  customer_id AS customer_key
  , customer_name
  FROM dim_customer__source
)
, dim_customer__cast_type AS (
  SELECT
  CAST(customer_key AS INTEGER) AS customer_key
  , CAST(customer_name AS string) AS customer_name
  FROM dim_customer__rename_column
)
SELECT customer_key
, customer_name
FROM dim_customer__cast_type