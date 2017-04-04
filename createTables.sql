DROP TABLE MOVIE cascade constraints;
DROP TABLE PRICE_TIER cascade constraints;
DROP TABLE CUSTOMER cascade constraints;
DROP TABLE CUST_ADDRESS cascade constraints;
DROP TABLE RENTAL cascade constraints;
DROP TABLE MOVIE_RENTAL cascade constraints;
DROP TABLE CARS cascade constraints;
DROP TABLE DELIVERY cascade constraints;
DROP TABLE ACTOR cascade constraints;
DROP TABLE MOVIE_ACTOR cascade constraints;
DROP TABLE EMPLOYEE cascade constraints;

CREATE TABLE price_tier(
  tier VARCHAR2(50) PRIMARY KEY,
  price NUMBER(5,2) NOT NULL,
  late_fee NUMBER(5,2) NOT NULL
);

CREATE TABLE movie(
  movie_id VARCHAR2(10) PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  category VARCHAR2(100) NOT NULL,
  total_quantity NUMBER(2,0) NOT NULL,
  available_quantity NUMBER(2,0) NOT NULL,
  tier varchar2(15) references price_tier(tier)
);

CREATE TABLE logs (
  log VARCHAR2(1000)
);

CREATE TABLE customer(
  customer_id VARCHAR2(10) PRIMARY KEY,
  full_name VARCHAR2(100) NOT NULL, 
  phone_num VARCHAR(10) NOT NULL
);

CREATE TABLE cust_ADDRESS(
customer_id varchar2(10) references customer(customer_id),
address varchar2(100) not null
);

CREATE TABLE employee(
  employee_id VARCHAR2(10) PRIMARY KEY, 
  manager_id VARCHAR2(10), 
  salary number(8,2) not null,
  name varchar2(50) not null,
  phone varchar2(10) not null
);

CREATE TABLE rental(
  rental_id varchar2(10) primary key,
  employee_id varchar2(10) references employee(employee_id),
  movie_id VARCHAR2(10) REFERENCES movie(movie_id),
  customer_id VARCHAR2(10) REFERENCES customer(customer_id),
  due_date DATE NOT NULL,
  returned CHAR(1) NOT NULL,
  rental_date date not null
  /*CHECK (due_date > current_date)*/
);

CREATE TABLE MOVIE_RENTAL(
movie_id varchar2(10) references movie(movie_id),
rental_id varchar2(10) references rental(rental_id)
);

CREATE TABLE cars(
  plate_number VARCHAR(8) PRIMARY KEY, 
  car_model VARCHAR(50) NOT NULL
);

CREATE TABLE delivery(
  customer_id VARCHAR2(10) REFERENCES customer(customer_id) NOT NULL,
  car_id VARCHAR2(10) REFERENCES cars(plate_number) NOT NULL,
  rental_id varchar2(10) references rental(rental_id)
);

CREATE TABLE actor(
  actor_id VARCHAR2(10) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL
);

CREATE TABLE movie_actor(
  movie_id VARCHAR2(10) REFERENCES movie(movie_id) NOT NULL,
  actor_id VARCHAR2(10) REFERENCES actor(actor_id) NOT NULL
);


