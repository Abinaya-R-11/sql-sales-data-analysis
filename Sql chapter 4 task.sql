drop database if exists salemanagementfinal;
create database salemanagementfinal;

use salemanagementfinal;
create table offices(
officeCode varchar(15) primary key,
city varchar(50),
phone varchar(20),
addressLine1 varchar(50),
addressLine2 varchar(50),
state varchar(50),
country varchar(50),
postalcode varchar(20),
territory varchar(30));

create table employees(
employeeNumber int primary key,
lastName varchar(50),
firstname varchar(50),
extension varchar(50),
email varchar(50),
officecode varchar(15),
reportsTo int,
jobTitle varchar(70),
foreign key(officecode) references offices(officecode),
foreign key(reportsTo) references employees(employeeNumber));

create table productlines(
productline varchar(50) primary key,
textDescription varchar(2000) ,
htmlDescription mediumtext,
image mediumblob);

create table products(
productCode varchar(20) primary key,
productName varchar(50),
productline varchar(50),
productScale varchar(10),
productVendor varchar(50),
productDescription text,
quantityInStock int,
buyprice decimal(10,2),
MSRP decimal(10,2),
foreign key(productline) references productlines(productline));

create table customers(
customerNumber int primary key,
customerName varchar(50),
contactLastName varchar(50),
contactFirstName varchar(50),
phone varchar(20),
addressLine1 varchar(50),
addressLine2 varchar(50),
city varchar(50),
state varchar(50),
postalCode varchar(20),
country varchar(50),
salesRepEmployeeNumber int,
creditlimit int,
foreign key(salesRepEmployeeNumber) references employees(employeeNumber));

create table payments(
customerNumber int,
checkNumber varchar(50),
paymentDate date,
amount decimal(10,2),
primary key(customerNumber,checkNumber),
foreign key(customerNumber) references customers(customerNumber));

create table orders(
orderNumber int primary key,
orderDate date,
requiredDate date,
shippedDate date,
orderStatus varchar(20),
comments text,
customerNumber int,
foreign key(customerNumber) references customers(customerNumber));

create table orderdetails(
orderNumber int ,
productCode varchar(20),
quantityOrdered int,
priceEach decimal(10,2),
orderLineNumber int,
primary key(orderNumber,productCode),
foreign key(orderNumber) references orders(orderNumber),
foreign key(productCode) references products(productCode));

insert into offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values
('1', 'Chennai', '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India', '560001', 'APAC'),
('8','Chennai','+91 44 2200111','Anna Salai',NULL,'Tamil Nadu','600017','India','APAC'),
('9','Madurai','+91 452 2200222','KK Nagar',NULL,'Tamil Nadu','625020','India','APAC'),
('10','Coimbatore','+91 422 2200333','Gandhipuram',NULL,'Tamil Nadu','641012','India','APAC'),
('11','Bangalore','+91 80 2200444','MG Road',NULL,'Karnataka','560001','India','APAC'),
('12','Hyderabad','+91 40 2200555','Banjara Hills',NULL,'Telangana','500034','India','APAC'),
('13','Mumbai','+91 22 2200666','Andheri',NULL,'Maharashtra','400053','India','APAC'),
('14','Delhi','+91 11 2200777','Connaught Place',NULL,'Delhi','110001','India','APAC'),
('15','Pune','+91 20 2200888','Shivaji Nagar',NULL,'Maharashtra','411005','India','APAC'),
('16','Kochi','+91 484 2200999','Marine Drive',NULL,'Kerala','682031','India','APAC'),
('17','Trichy','+91 431 2200101','Main Road',NULL,'Tamil Nadu','620001','India','APAC');

insert into employees(employeeNUmber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
values
(1002, 'Kumar', 'Arun', 'x101', 'arun.kumar@classic.com', '1', NULL, 'Sales Manager'),
(1056, 'Ravi', 'Suresh', 'x102', 'suresh.ravi@classic.com', '1', 1002, 'Sales Rep'),
(1076, 'Sharma', 'Neha', 'x103', 'neha.sharma@classic.com', '2', 1002, 'Sales Rep'),
(1089,'Arun','Kumar','x5001','arun@company.com','1',1056,'Sales Rep'),
(1090,'Priya','Raman','x5002','priya@company.com','1',1056,'Sales Rep'),
(1091,'Vikram','Das','x5003','vikram@company.com','8',1076,'Sales Rep'),
(1092,'Sneha','Paul','x5004','sneha@company.com','2',1076,'Sales Rep'),
(1093,'Karthik','Raj','x5005','karthik@company.com','1',1056,'Sales Rep'),
(1094,'Anu','Mehta','x5006','anu@company.com','16',1089,'Sales Rep'),
(1095,'Ramesh','Iyer','x5007','ramesh@company.com','15',1056,'Sales Rep'),
(1096,'Divya','Nair','x5008','divya@company.com','13',1076,'Sales Rep'),
(1097,'Manoj','Singh','x5009','manoj@company.com','12',1089,'Sales Rep'),
(1098,'Keerthi','Rao','x5010','keerthi@company.com','17',1056,'Sales Rep');

insert into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
values
(2001, 'ABC Traders', 'Rao', 'Vikram', '+91-9876543210','Anna Nagar', NULL, 'Chennai', 'Tamil Nadu', '600040', 'India', 1056, 150000),
(2002, 'XYZ Electronics', 'Patel', 'Amit', '+91-9123456789', 'Indiranagar', NULL, 'Bangalore', 'Karnataka', '560038', 'India', 1076, 200000),
(2003, 'Sun Mobiles', 'Kannan', 'Raju', '+91-9000011111','KK Nagar', NULL,'Chennai','Tamil Nadu','600078','India',1056,175000),
(2004, 'Green Stores', 'Singh', 'Rohit', '+91-9000011112','Adyar',NULL,'Chennai','Tamil Nadu','600020','India',1056,180000),
(2005, 'Tech World', 'Das', 'Anil', '+91-9000011113','BTM Layout',NULL,'Bangalore','Karnataka','560076','India',1076,220000),
(2006, 'Royal Traders', 'Mehta', 'Pooja', '+91-9000011114','Velachery',NULL,'Chennai','Tamil Nadu','600042','India',1056,160000),
(2007, 'Modern Mart', 'Reddy', 'Kiran', '+91-9000011115','Mylapore',NULL,'Chennai','Tamil Nadu','600004','India',1056,195000),
(2008, 'Elite Electronics', 'Verma', 'Sanjay', '+91-9000011116','Whitefield',NULL,'Bangalore','Karnataka','560066','India',1076,250000),
(2009, 'Prime Autos', 'Joshi', 'Rahul', '+91-9000011117','Anna Nagar',NULL,'Chennai','Tamil Nadu','600040','India',1056,140000),
(2010, 'Mega Bazaar', 'Nair', 'Deepa', '+91-9000011118','Tambaram',NULL,'Chennai','Tamil Nadu','600045','India',1056,170000),
(2011, 'Star Supplies', 'Iyer', 'Lakshmi', '+91-9000011119','Koramangala',NULL,'Bangalore','Karnataka','560034','India',1076,210000),
(2012, 'City Traders', 'Paul', 'David', '+91-9000011120','Madurai Main',NULL,'Madurai','Tamil Nadu','625001','India',1056,155000);

insert into productlines(productline,textDescription,htmlDescription,image)
values
('Classic Cars', 'Vintage and classic model cars', NULL, NULL),
('Motorcycles', 'Racing and sports bikes', NULL, NULL),
('Trucks','Heavy vehicle models', NULL, NULL),
('Planes','Aircraft models', NULL, NULL),
('Ships','Ship collections', NULL, NULL),
('Vintage Series','Old collection models', NULL, NULL),
('Sports Series','Sports edition models', NULL, NULL),
('Premium Models','Luxury model collection', NULL, NULL),
('Mini Models','Small scale models', NULL, NULL),
('Collector Edition','Special collector items', NULL, NULL);

insert into products(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyprice,MSRP)
values
('S10_1678', '1969 Harley Davidson', 'Motorcycles', '1:10','Min Lin Diecast','Classic Harley Davidson bike model', 100, 4800, 6500),
('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12','Autoart Studio', 'Classic Ford Mustang model', 50, 9500, 12000),
('S18_5001','Classic Bike','Motorcycles','1:10', 'Vendor A','Red bike model',50,3200,6500),
('S18_5002','Speed Racer','Motorcycles','1:10', 'Vendor B','Sports bike model',40,3500,7000),
('S24_6001','Vintage Car','Classic Cars','1:12','Vendor C','Vintage model',35,5000,9000),
('S24_6002','Road Master','Classic Cars','1:12','Vendor C','Sedan model',60,4700,8500),
('S32_7001','Truck Pro','Trucks','1:18','Vendor D','Truck model',30,6200,11000),
('S32_7002','Cargo King','Trucks','1:18','Vendor D','Cargo truck',28,6400,11500),
('S50_8001','Jet Flyer','Planes','1:20','Vendor E','Jet model',22,7200,13000),
('S50_8002','Sky Wings','Planes','1:20','Vendor E','Aircraft model',20,7500,13500),
('S70_9001','Ocean Ship','Ships','1:25','Vendor F','Ship model',18,8000,14500),
('S70_9002','Sea Queen','Ships','1:25','Vendor F','Cruise ship model',16,8200,15000);

insert into orders(orderNumber,orderDate,requiredDate,shippedDate,orderStatus,comments,customerNumber)
values
(30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped', 'Delivered on time', 2001),
(30002, '2026-01-12', '2026-01-18', NULL, 'In Process', NULL, 2002),
(30003,'2026-01-18','2026-01-22','2026-01-20','Shipped',NULL,2003),
(30004,'2026-01-19','2026-01-24',NULL,'In Process',NULL,2004),
(30005,'2026-01-20','2026-01-25','2026-01-23','Shipped',NULL,2005),
(30006,'2026-01-21','2026-01-26','2026-01-24','Shipped',NULL,2006),
(30007,'2026-01-22','2026-01-27',NULL,'In Process',NULL,2007),
(30008,'2026-01-23','2026-01-28','2026-01-26','Shipped',NULL,2008),
(30009,'2026-01-24','2026-01-29','2026-01-27','Shipped',NULL,2009),
(30010,'2026-01-25','2026-01-30',NULL,'In Process',NULL,2010),
(30011,'2026-01-26','2026-01-31','2026-01-29','Shipped',NULL,2011),
(30012,'2026-01-27','2026-02-02',NULL,'In Process',NULL,2012);

insert into orderdetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber)
values
(30001, 'S10_1678', 2, 6500, 1),
(30002, 'S12_1099', 1, 12000, 1),
(30003,'S10_1678',3,6500,1),
(30004,'S12_1099',2,12000,1),
(30005,'S10_1678',4,6500,1),
(30006,'S12_1099',1,12000,1),
(30007,'S10_1678',2,6500,1),
(30008,'S12_1099',3,12000,1),
(30009,'S10_1678',5,6500,1),
(30010,'S12_1099',2,12000,1),
(30011,'S10_1678',1,6500,1),
(30012,'S12_1099',4,12000,1);

insert into payments(customerNumber,checkNumber,paymentDate,amount)
values
(2001, 'CHK1001', '2026-01-16', 13000),
(2002, 'CHK1002', '2026-01-17', 12000),
(2003,'CHK1003','2026-01-20',19500),
(2004,'CHK1004','2026-01-21',24000),
(2005,'CHK1005','2026-01-23',26000),
(2006,'CHK1006','2026-01-24',12000),
(2007,'CHK1007','2026-01-25',13000),
(2008,'CHK1008','2026-01-26',36000),
(2009,'CHK1009','2026-01-27',32500),
(2010,'CHK1010','2026-01-28',24000),
(2011,'CHK1011','2026-01-29',6500),
(2012,'CHK1012','2026-01-30',48000),
(2003,'CHK1013','2026-01-31',35000),
(2012,'CHK1004','2026-01-31',24000),
(2005,'CHK1004','2026-01-31',24000),
(2009,'CHK1004','2026-01-31',24000);

## Task 1 - Aggregate Functions

##1. Total quantity ordered
select sum(quantityOrdered) as Total_quantity_ordered
from orderdetails;

##2. Total number of employees
select count(*) as Total_employees
from employees;

##3. Average credit limit
select avg(creditLimit) as Average_credit_limit
from customers;

##Task 2 - Aggregate functions with WHERE

##1. Count the orders which were shipped
select orderStatus,count(orderStatus) as Total_shipped_orders
from orders
where orderStatus = 'Shipped';

##2. toal quantity ordered for the product code S12_1099
select productCode,sum(quantityOrdered) as Total_quantity_ordered
from orderdetails
where productCode = 'S12_1099';

##3. Average payment by customer
select customerNumber,avg(amount) as average_paid
from payments
where customerNumber = 2003;

## Task 3- Aggregate functions with GROUP BY

##1. Quantity in each productline
select productLine,sum(quantityInStock) as Total_quantity
from products
group by productLIne;

##2. customer count based on State
select state,count(customerName) as total_customers
from customers
group by state;

##3. Max quantity ordered in each product
select productCode,max(quantityOrdered) as Max_quantity_ordered
from orderdetails
group by productCode
having Max_quantity_ordered>3;

##Task 4 - Subqueries

##1. min quantity product in classic cars
select productName,quantityInStock
from products
where quantityInStock = (
select min(quantityInStock) as min_quantity
from products
where productLine = 'Classic Cars'
)


