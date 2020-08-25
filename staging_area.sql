-- Atividade referente ao Workshop: ETL ao DW

-- Staging Area

-- Criação do banco de dados Staging Area
create database staging_area;


-- Criação da tabela st_customers na staging area
create table st_customers
(
	 CUSTOMER_ID bigint,
	 CUST_FIRST_NAME varchar(40),
	 CUST_LAST_NAME varchar(50),
	 STREET_ADDRESS varchar(50),
	 POSTAL_CODE varchar(15),
	 CITY varchar(30),
	 STATE_PROVINCE varchar(3),
	 COUNTRY_ID varchar(2),
	 COUNTRY_NAME varchar(30),
	 REGION_ID bigint,
	 NLS_LANGUAGE varchar(3),
	 NLS_TERRITORY varchar(11),
	 CREDIT_LIMIT bigint,
	 CUST_EMAIL varchar(50),
	 PRIMARY_PHONE_NUMBER varchar(30),
	 PHONE_NUMBER_2 varchar(30),
	 ACCOUNT_MGR_ID bigint,
	 LOCATION_GTYPE bigint,
	 LOCATION_SRID bigint,
	 LOCATION_X varchar(30),
	 LOCATION_Y varchar(30),
	 primary key (CUSTOMER_ID)
)
;

-- Input arquivo CSV 
copy st_customers
from 'C:\Base de dados PDI\Workshop ETL\customers.csv'
delimiter ','
csv header
;

select * from  st_customers;

-- Criação da tabela salesrep na staging area
create table st_salesrep
(
	 EMPLOYEE_ID bigint,
	 FIRST_NAME varchar(30),
	 LAST_NAME varchar(50),
	 EMAIL varchar(50),
	 PHONE_NUMBER varchar(30),
	 HIRE_DATE timestamp,
	 JOB_ID varchar(6),
	 SALARY bigint,
	 COMMISSION_PCT float,
	 MANAGER_ID bigint,
	 DEPARTMENT_ID bigint,
	 primary key (EMPLOYEE_ID)
)
;

-- Input arquivo CSV 
copy st_salesrep
from 'C:\Base de dados PDI\Workshop ETL\salesrep.csv'
delimiter ','
csv header
;

select * from  st_salesrep;

-- Criação da tabela products na staging area
create table st_products
(
	 PRODUCT_ID bigint,
	 PRODUCT_NAME varchar(40),
	 LANGUAGE_ID varchar(2),
	 MIN_PRICE bigint,
	 LIST_PRICE bigint,
	 PRODUCT_STATUS varchar(17),
	 SUPPLIER_ID bigint,
	 WARRANTY_PERIOD varchar(6),
	 WEIGHT_CLASS bigint,
	 PRODUCT_DESCRIPTION text,
	 CATEGORY_ID bigint,
	 CATALOG_URL varchar(80),
	 SUB_CATEGORY_NAME varchar(30),
	 SUB_CATEGORY_DESCRIPTION text,
	 PARENT_CATEGORY_ID bigint,
	 CATEGORY_NAME varchar(30),
	 primary key (PRODUCT_ID)
)
;

-- Input arquivo CSV 
copy st_products
from 'C:\Base de dados PDI\Workshop ETL\products.csv'
delimiter ','
csv header
;

select * from st_products;

-- Criação da tabela promotions na staging area
create table st_promotions
(
	 PROMO_ID bigint,
	 PROMO_NAME varchar(30),
	 primary key (PROMO_ID)
)
;

-- Input arquivo CSV 
copy st_promotions
from 'C:\Base de dados PDI\Workshop ETL\promotions.csv'
delimiter ','
csv header
;

select * from st_promotions;


-- Criação da tabela orders na staging area
create table st_orders
(
	 ORDER_ID bigint,
	 ORDER_DATE timestamp,
	 CUSTOMER_ID bigint,
	 ORDER_STATUS bigint,
	 ORDER_TOTAL double precision,
	 SALES_REP_ID bigint,
	 PROMO_ID bigint,
	 LINE_ITEM_ID bigint,
	 PRODUCT_ID bigint,
	 UNIT_PRICE double precision,
	 QUANTITY bigint,
	 foreign key (CUSTOMER_ID)	references st_customers  (CUSTOMER_ID),
	 foreign key (SALES_REP_ID) references st_salesrep   (EMPLOYEE_ID),
	 foreign key (PROMO_ID)	    references st_promotions (PROMO_ID),	
	 foreign key (PRODUCT_ID)	references st_products   (PRODUCT_ID)
)
;

-- Input arquivo CSV 
copy st_orders
from 'C:\Base de dados PDI\Workshop ETL\orders.csv'
delimiter ','
csv header
;

select * from st_orders;

