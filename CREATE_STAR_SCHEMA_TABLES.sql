CREATE TABLE customers(
pid int primary key,
pname varchar(50),
age int,
gender char(1)
);
CREATE TABLE cards(
cardno char(16) primary key,
card_brand varchar(30),
card_type varchar(20)
);
CREATE TABLE timeinfo(
tdate datetime primary key,
t_year int,
t_month int,
t_dayofmonth int,
t_hour int,
t_quarter int,
t_week int,
t_dayofyear int,
t_dayofweek int
);
CREATE TABLE cities(
mcc int primary key,
merchant_city varchar(50)
);
CREATE TABLE transaction_types(
ttc int primary key,
trans_type varchar(30)
);
CREATE TABLE transactions(
ttc int,
pid int,
cardno char(16),
tdate datetime,
mcc int,
amount decimal(6,2),

primary key(ttc,pid,cardno,tdate,mcc),
foreign key (ttc) references transaction_types(ttc),
foreign key (pid) references customers(pid),
foreign key (cardno) references cards(cardno),
foreign key (tdate) references timeinfo(tdate),
foreign key (mcc) references cities(mcc)
);

