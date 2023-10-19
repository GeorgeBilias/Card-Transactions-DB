INSERT INTO customers(pid,pname,age,gender)
SELECT DISTINCT pid,pname,age,gender
FROM CardsTransactions;

INSERT INTO cards(cardno,card_brand,card_type)
SELECT DISTINCT cardno,card_brand,card_type
FROM CardsTransactions;

SET DATEFIRST 1;
INSERT INTO timeinfo(tdate,t_year,t_month,t_dayofmonth,t_hour,t_quarter,t_week,t_dayofyear,t_dayofweek)
 SELECT DISTINCT tdate, datepart(year, tdate), datepart(month, tdate), 
 datepart(day,tdate),datepart(hour, tdate), 
 datepart(quarter,tdate), datepart(week,tdate),
 datepart(dayofyear,tdate),datepart(dw,tdate)
 FROM CardsTransactions;

INSERT INTO cities(mcc,merchant_city)
SELECT DISTINCT mcc,merchant_city
FROM CardsTransactions;

INSERT INTO transaction_types(ttc,trans_type)
SELECT DISTINCT ttc,trans_type
FROM CardsTransactions;

INSERT INTO transactions(ttc,pid,cardno,tdate,mcc,amount)
SELECT ttc,pid,cardno,tdate,mcc,amount
FROM CardsTransactions;

