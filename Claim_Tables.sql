create table Customers ( Customer_ID number PRIMARY KEY, Cust_name varchar2(100) not null,
 Phone_number varchar2(15), Address varchar2(200), 
 cust_type varchar(50) CHECK (cust_type IN ('Tinder', 'Dealer', 'Company', 'Branch Customer')),
 cust_code varchar(50) NOT NULL );
 
 create table Tires ( Tire_ID number PRIMARY KEY, Customer_ID number REFERENCES Customers(Customer_ID),
 Serial_number varchar2(50) not null, Tire_size varchar2(30) not null, Brand varchar2(50) not null,
 Patter varchar2(50) not null, load_speed varchar2(20), RTD_1 number(5, 2), RTD_2 number(5, 2), RTD_3 number(5, 2),
 DOT_Date number(5) not null, DOT varchar2(15) not null, Origin varchar2(20));
 
 create table Inspections ( Inspactions_id number PRIMARY KEY, Tire_ID number REFERENCES Tires(Tire_ID),
 Insp_date DATE DEFAULT SYSDATE, Inspector varchar2(100), zone varchar2(50) not null, Description VARCHAR2(500) not null,
 Possible_Causes VARCHAR2(500) not null );
 
 create table Decisions ( Decisions_ID number PRIMARY KEY, Tire_ID number REFERENCES Tires(Tire_ID),
 Insp_date DATE DEFAULT SYSDATE, Inspector varchar2(100), zone varchar2(50) not null, Description VARCHAR2(500) not null,
 Possible_Causes VARCHAR2(500) not null, Condation varchar2(50) CHECK (Condation IN ('Accepted', 'Rejected')),
 Recommendation VARCHAR2(500) );
 
 create table Image ( Image_ID number PRIMARY KEY, Tire_ID number REFERENCES Tires(Tire_ID), Image BLOB);
 
 create table CUsers ( User_ID number PRIMARY KEY, Username varchar2(100) not null, C_Password varchar2(50) not null,
  Claim_Role varchar2(50) );

COMMIT;