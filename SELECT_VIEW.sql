SET STATISTICS IO ON;
-- GROUP BY ( )
SELECT NULL AS t_year, NULL AS card_brand, NULL AS gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube

UNION ALL

-- GROUP BY (t_year)
SELECT t_year, NULL AS card_brand, NULL AS gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY t_year

UNION ALL

-- GROUP BY (card_brand)
SELECT NULL AS t_year, card_brand, NULL AS gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY card_brand

UNION ALL

-- GROUP BY (gender)
SELECT NULL AS t_year, NULL AS card_brand, gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY gender

UNION ALL

-- GROUP BY (card_brand,gender)
SELECT NULL AS t_year, card_brand, gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY card_brand,gender

UNION ALL

-- GROUP BY (t_year,gender)
SELECT t_year, NULL AS card_brand, gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY t_year,gender

UNION ALL

-- GROUP BY (t_year,card_brand)
SELECT t_year, card_brand, NULL AS gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY t_year,card_brand

UNION ALL

--GROUP BY (t_year,card_brand,gender)
SELECT t_year, card_brand, gender, SUM(transactions_no) AS total_transactions
FROM materialized_view_cube
GROUP BY t_year,card_brand,gender