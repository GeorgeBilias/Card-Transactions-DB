CREATE VIEW materialized_view_cube 
WITH SCHEMABINDING 
AS
SELECT [ti].t_year, [ca].card_brand, [cu].gender, COUNT_BIG(*) AS transactions_no
FROM dbo.transactions [t],dbo.timeinfo [ti],dbo.cards [ca],dbo.customers [cu]
WHERE [ti].tdate = [t].tdate AND [ca].cardno = [t].cardno AND [cu].pid = [t].pid
GROUP BY [ti].t_year, [ca].card_brand, [cu].gender
