BULK INSERT CardsTransactions
FROM 'C:\Users\georg\OneDrive\Desktop\CardsTransactions.txt'
WITH (FIRSTROW =2, FIELDTERMINATOR='|', ROWTERMINATOR = '\n');