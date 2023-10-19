SELECT merchant_city,sum(amount) AS total_transactions
FROM cities
INNER JOIN transactions
ON cities.mcc = transactions.mcc
GROUP BY merchant_city
ORDER BY merchant_city ASC