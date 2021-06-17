CREATE schema new_schema;
USE new_schema;

CREATE TABLE STATES(
STATEID INT PRIMARY KEY AUTO_INCREMENT,
STCODE VARCHAR(2) NOT NULL,
STATENAME VARCHAR(255) NOT NULL
);
INSERT INTO STATES(STCODE,STATENAME) VALUES
('AL','Alabama');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('AK','Alaska');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('AZ','Arizona');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('AR','Arkansas');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('CA','California');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('CO','Colorado');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('CT','Connecticut');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('DE','Delaware');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('FL','Florida');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('GA','Georgia');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('HI','Hawaii');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('ID','Idaho');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('IL','Illinois');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('IN','Indiana');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('IA','Iowa');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('KS','Kansas');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('KY','Kentucky');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('LA','Louisiana');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('ME','Maine');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MD','Maryland');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MA','Massachusetts');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MI','Michigan');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MN','Minnesota');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MS','Mississippi');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MO','Missouri');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('MT','Montana');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NE','Nebraska');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NV','Nevada');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NH','New Hampshire');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NJ','New Jersey');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NM','New Mexico');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NY','New York');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('NC','North Carolina');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('ND','North Dakota');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('OH','Ohio');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('OK','Oklahoma');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('OR','Oregon');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('PA','Pennsylvania');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('RI','Rhode Island');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('SC','South Carolina');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('SD','South Dakota');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('TN','Tennessee');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('TX','Texas');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('UT','Utah');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('VT','Vermont');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('VA','Virginia');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('WA','Washington');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('WV','West Virginia');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('WI','Wisconsin');
INSERT INTO STATES(STCODE,STATENAME) VALUES
('WY','Wyoming');

CREATE TABLE CUSTOMER(
CUSTOMERID INT PRIMARY KEY AUTO_INCREMENT,
CNAME VARCHAR(255) NOT NULL,
CSURNAME VARCHAR(255) NOT NULL,
CPHONENUMBER VARCHAR(14) NOT NULL,
CSTATE INT NOT NULL,
CBIRTHDATE DATE,
FOREIGN KEY (CSTATE) 
    REFERENCES STATES(STATEID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE
);
CREATE TABLE PRODUCT(
PRODUCTID INT PRIMARY KEY AUTO_INCREMENT,
PRNAME VARCHAR(255) NOT NULL,
PRBRAND VARCHAR(255) NOT NULL,
PRCATEGORY VARCHAR(255) NOT NULL,
PRICE INT NOT NULL
);

CREATE TABLE DEPARTMENT(
DEPTID INT PRIMARY KEY AUTO_INCREMENT,
DEPTNAME VARCHAR(2) NOT NULL
);
CREATE TABLE BRANCH(
BRANCHID INT PRIMARY KEY AUTO_INCREMENT,
BRANCHNAME VARCHAR(2) NOT NULL,
BRANCHSTATE VARCHAR(255) NOT NULL,
BRPHONENUMBER VARCHAR(14) NOT NULL
);
CREATE TABLE EMPLOYEE(
EMPID INT PRIMARY KEY AUTO_INCREMENT,
EMPNAME VARCHAR(255) NOT NULL,
EMPSURNAME VARCHAR(255) NOT NULL,
EMPPHONENUMBER VARCHAR(14) NOT NULL,
EMPBRANCH INT NOT NULL,
EMPDEPT INT NOT NULL,
CRTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (EMPBRANCH) 
    REFERENCES BRANCH(BRANCHID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE,
FOREIGN KEY (EMPDEPT) 
    REFERENCES DEPARTMENT(DEPTID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE
);
CREATE TABLE PURCHASE(
PURCHASEID INT PRIMARY KEY AUTO_INCREMENT,
CUSTID INT NOT NULL,
PRODUCTID INT NOT NULL,
BRANCHID INT NOT NULL,
PURCHASEDATE DATE,
FOREIGN KEY (CUSTID) 
    REFERENCES CUSTOMER(CUSTOMERID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE,
FOREIGN KEY (PRODUCTID) 
    REFERENCES PRODUCT(PRODUCTID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE,
FOREIGN KEY (BRANCHID) 
    REFERENCES BRANCH(BRANCHID) 
    ON UPDATE RESTRICT 
    ON DELETE CASCADE
);