/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jiraw
 * Created: Oct 6, 2016
 */
/*
    int 1,234,567,891
*/

create table COMPANIES
(
	COMPANY_ID INTEGER not null primary key 
        AUTO_INCREMENT,
	COMPANY_NAME VARCHAR(255) not null,
	COMPANY_DESCRIPTION VARCHAR(255)
) ;

ALTER table COMPANIES auto_increment = 1;

INSERT INTO COMPANIES (COMPANY_NAME, COMPANY_DESCRIPTION) 
	VALUES ('TEST_COMPANY', 'TEST_DESCRIPITION') ;

create table STAFFS
(
	STAFF_ID INTEGER not null primary key 
        AUTO_INCREMENT,
	COMPANY_ID INTEGER not null,
	FIRSTNAME VARCHAR(255) not null,
	LASTNAME VARCHAR(255) not null,
	CITIZENNO NUMERIC(13) not null,
	ADDRESS VARCHAR(255) not null,
	POSITION VARCHAR(255) not null
) ;

ALTER table STAFFS auto_increment = 10001;

INSERT INTO STAFFS (COMPANY_ID, FIRSTNAME, LASTNAME, CITIZENNO, ADDRESS, POSITION) 
	VALUES (1, 'testFname', 'testLname', 1111111111111, 'testAddress', 'testPosition') ;

create table ACCOUNTS
(
	ID INTEGER not null primary key 
        AUTO_INCREMENT,
	USERNAME VARCHAR(255) not null,
	PASSWORD VARCHAR(255) not null,
	STAFF_ID INTEGER not null
) ;

ALTER table ACCOUNTS auto_increment = 100001;

INSERT INTO ACCOUNTS (USERNAME, PASSWORD, STAFF_ID)
	VALUES ('test', 'test', 10001) ;


create table BRANCH
(
	BRANCH_ID INTEGER not null primary key 
        AUTO_INCREMENT,
	BRANCH_NAME VARCHAR(255) not null,
	LOCATION VARCHAR(255) not null
) ;

ALTER table BRANCH auto_increment = 1000001;

INSERT INTO BRANCH (BRANCH_NAME, LOCATION)
        VALUES ('testWarehouseName', 'testWarehouseLocation') ;

create table PRODUCTS
(
	PROD_ID BIGINT not null primary key 
        AUTO_INCREMENT,
	PROD_NAME VARCHAR(255) not null,
	PRICE DOUBLE not null,
	AMOUNT INTEGER not null,
	BRANCH_ID INTEGER not null,
	PROD_TYPE VARCHAR(255) not null,
	COMPANY_ID INTEGER not null
) ;

ALTER table PRODUCTS auto_increment = 10000001;

INSERT INTO PRODUCTS (PROD_NAME, PRICE, AMOUNT, BRANCH_ID, PROD_TYPE, COMPANY_ID)
        VALUES ('testProdName', 9999, 5555, 1000001, 'testProdType', 1) ;

create table PRODUCT_STATUS
(
	ID INTEGER not null primary key 
        AUTO_INCREMENT,
	PROD_ID BIGINT not null,
	CANCLE_STATUS BOOLEAN not null
) ;

ALTER table PRODUCT_STATUS auto_increment = 1000001;

INSERT INTO PRODUCT_STATUS (PROD_ID, CANCLE_STATUS)
        VALUES (10000001, FALSE) ;

create table ORDERS
(
	ORDER_ID INTEGER not null primary key 
        AUTO_INCREMENT,
	STAFF_ID INTEGER not null,
	ORDERTYPE VARCHAR(255) not null,
	DATE_ORDER DATE not null
) ;

ALTER table ORDERS auto_increment = 10000001 ;

INSERT INTO ORDERS (STAFF_ID, ORDERTYPE, DATE_ORDER)
        VALUES (10001, 'BUY', '2016-10-16') ;

create table ORDERDETAIL
(
	ID INTEGER not null 
        AUTO_INCREMENT,
	ORDER_ID INTEGER not null,
	ITEM_NO INTEGER not null,
	PROD_ID BIGINT not null, 
	AMOUNT INTEGER not null,
	PRICE DOUBLE not null,
        primary key (ID, ITEM_NO)
) ;

ALTER table ORDERDETAIL auto_increment = 1000001; 

INSERT INTO ORDERDETAIL (ORDER_ID, ITEM_NO, PROD_ID, AMOUNT, PRICE)
        VALUES (10000001, 1, 10000001, 5555, 9999) ;

create table ALERT
(
    alertAmount INTEGER not null
);

INSERT INTO ALERT(alertAmount) VALUES(50);


ALTER TABLE PRODUCTS
ADD FOREIGN KEY (COMPANY_ID)
REFERENCES COMPANIES(COMPANY_ID) ;

ALTER TABLE PRODUCT_STATUS
ADD FOREIGN KEY (PROD_ID)
REFERENCES PRODUCTS(PROD_ID) ;

ALTER TABLE PRODUCTS
ADD FOREIGN KEY (BRANCH_ID)
REFERENCES BRANCH(BRANCH_ID) ;

ALTER TABLE STAFFS
ADD FOREIGN KEY (COMPANY_ID)
REFERENCES COMPANIES(COMPANY_ID) ;

ALTER TABLE ACCOUNTS
ADD FOREIGN KEY (STAFF_ID)
REFERENCES STAFFS(STAFF_ID) ;

ALTER TABLE ORDERS
ADD FOREIGN KEY (STAFF_ID)
REFERENCES STAFFS(STAFF_ID) ;

ALTER TABLE ORDERDETAIL
ADD FOREIGN KEY (ORDER_ID)
REFERENCES ORDERS(ORDER_ID) ;

ALTER TABLE ORDERDETAIL
ADD FOREIGN KEY (PROD_ID)
REFERENCES PRODUCTS(PROD_ID) ;
