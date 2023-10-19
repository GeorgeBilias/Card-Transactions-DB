SELECT card_brand,card_type,COUNT(amount) AS amount_of_transactions,SUM(amount) AS total_transactions
FROM cards
INNER JOIN transactions 
ON cards.cardno = transactions.cardno
GROUP BY card_brand,card_type