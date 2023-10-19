SELECT trans_type,t_quarter,SUM(amount) as total_transactions
FROM transactions
INNER JOIN timeinfo
ON timeinfo.tdate = transactions.tdate
INNER JOIN transaction_types
ON transaction_types.ttc = transactions.ttc
WHERE t_year = 2019
GROUP BY trans_type,t_quarter