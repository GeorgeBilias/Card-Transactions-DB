SELECT t_year,gender,sum(amount) as total_transactions
FROM timeinfo
INNER JOIN transactions
ON timeinfo.tdate = transactions.tdate
INNER JOIN customers
ON transactions.pid = customers.pid
GROUP BY t_year,gender
ORDER BY t_year DESC