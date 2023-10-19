SELECT t_year,gender,age,SUM(amount) as online_transactions
FROM transactions
INNER JOIN timeinfo
ON timeinfo.tdate = transactions.tdate
INNER JOIN customers
ON customers.pid = transactions.pid
INNER JOIN transaction_types
ON transaction_types.ttc = transactions.ttc
WHERE trans_type='Online Transaction'
GROUP BY ROLLUP (t_year,gender,age)