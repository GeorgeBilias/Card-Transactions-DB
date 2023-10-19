SELECT t_year,card_brand,gender,COUNT(amount) AS transactions_no
FROM transactions
INNER JOIN timeinfo
ON timeinfo.tdate = transactions.tdate
INNER JOIN cards
ON cards.cardno = transactions.cardno
INNER JOIN customers 
ON customers.pid = transactions.pid
GROUP BY CUBE (t_year,card_brand,gender)
ORDER BY transactions_no