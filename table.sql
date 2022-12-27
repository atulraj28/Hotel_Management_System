Drop user hotel cascade
/
create user hotel identified by hotel
/
grant dba to hotel
/
conn hotel/hotel
/
create table customer
(
cust_id nvarchar2(10) constraint custIDpkchk1 primary key,
constraint custidpkchk2 check(cust_id like 'C%'),
cfname nvarchar2(40),
clname nvarchar2(40),
creserv nvarchar2(40),
address nvarchar2(100),
contact number(15)
)
/
create table payments
(
pay_id nvarchar2(10) constraint payidpkchk1 primary key,
constraint payidpkchk2 check(pay_id like 'P%'),
cust_id nvarchar2(10) constraint custidfk1 references customer(cust_id) on delete cascade,
type nvarchar2(40),
pay_day nvarchar2(60)
)
/
create table room_class
(
class_id nvarchar2(20) constraint classidpkchk1 primary key,
constraint classidpkchk2 check(class_id like'C%'),
name nvarchar2(10),
price number(8)
)
/
create table room_info
(
room_id nvarchar2(10) constraint roomidpk1 primary key,
constraint roomidpk2 check(room_id like 'R%'),
room_type nvarchar2(40) constraint roomtypechk references room_class(class_id) on delete cascade
)
/
create table reservation 
(
reser_id nvarchar2(10) constraint reseridpkchk1 primary key,
constraint reseridpkchk2 check(reser_id like 'R%'),
cust_id nvarchar2(30) constraint custreserfkchk references customer(cust_id) on delete cascade,
room_id nvarchar2(50) constraint roomidfkreser references room_info(room_id)on delete cascade,
reser_date nvarchar2(50),
date_in nvarchar2(50),
date_out nvarchar2(50)
)
/
create table employee
(
empid nvarchar2(10) constraint empidpkchk1 primary key,
constraint empidpkchk2 check(empid like 'E%'),
fname nvarchar2(30),
lname nvarchar2(10),
job_debt nvarchar2(10),
address nvarchar2(60),
contact number(15)
)
/
create table transactions
(
tid nvarchar2(10) constraint tidpkchk1 primary key,
constraint tidpkchk2 check(tid like 'T%'),
cust_id nvarchar2(30) constraint trancidfkchk references customer (cust_id) on delete cascade,
emp_id nvarchar2(30) constraint tranempidfkchk references employee(empid) on delete cascade,
reser_id nvarchar2(10) constraint tranresidfkchk references reservation(reser_id) on delete cascade,
trans_date nvarchar2(50)
)
/