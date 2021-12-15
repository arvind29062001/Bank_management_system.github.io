create database banksystem;
use banksystem;

CREATE TABLE `admin` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT,
  `Admin_name` varchar(20) NOT NULL,
  `Contact_no` decimal(10,0) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Total_user` int DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ;
CREATE TABLE `admin_login_system` (
  `Login_ID` varchar(20) NOT NULL,
  `Login_Password` varchar(20) NOT NULL,
  `Admin_ID` int NOT NULL,
  PRIMARY KEY (`Login_ID`),
  UNIQUE KEY `Login_ID` (`Login_ID`),
  KEY `Admin_ID` (`Admin_ID`),
  CONSTRAINT `admin_login_system_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`)
) ;
CREATE TABLE `accounts` (
  `Account_no` int NOT NULL AUTO_INCREMENT,
  `Account_status` varchar(20) DEFAULT NULL,
  `Account_name` varchar(20) NOT NULL,
  `Balance` int NOT NULL,
  `Interest_rate` int NOT NULL,
  `Admin_ID` int DEFAULT NULL,
  `Phone_no` decimal(10,0) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `Aadhaar_no` decimal(12,0) NOT NULL,
  `Voter_ID` int DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Account_type` varchar(20) DEFAULT NULL,
  `Pan_card` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Account_no`),
  UNIQUE KEY `Aadhaar_no` (`Aadhaar_no`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Voter_ID` (`Voter_ID`),
  UNIQUE KEY `Pan_card` (`Pan_card`),
  KEY `Admin_ID` (`Admin_ID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `transaction_history` (
  `Transaction_status` varchar(20) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ToAccount_ID` int DEFAULT NULL,
  `Transaction_date` datetime NOT NULL,
  `Transaction_ID` int NOT NULL AUTO_INCREMENT,
  `Transaction_type` varchar(20) NOT NULL,
  `Account_no` int NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  KEY `Account_no` (`Account_no`),
  CONSTRAINT `transaction_history_ibfk_1` FOREIGN KEY (`Account_no`) REFERENCES `accounts` (`Account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `account_login_system` (
  `Login_ID` int NOT NULL AUTO_INCREMENT,
  `Login_password` varchar(20) NOT NULL,
  `Account_no` int NOT NULL,
  PRIMARY KEY (`Login_ID`),
  KEY `Account_no` (`Account_no`),
  CONSTRAINT `account_login_system_ibfk_1` FOREIGN KEY (`Account_no`) REFERENCES `accounts` (`Account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loan` (
  `Interest` int NOT NULL DEFAULT '12',
  `Amount` int DEFAULT NULL,
  `Loan_ID` int NOT NULL AUTO_INCREMENT,
  `Account_no` int NOT NULL,
  `Loan_status` varchar(20) DEFAULT NULL,
  `period` varchar(20) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `loan_pass_on` date DEFAULT NULL,
  `amount_passed` int DEFAULT NULL,
  PRIMARY KEY (`Loan_ID`),
  KEY `Account_no` (`Account_no`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`Account_no`) REFERENCES `accounts` (`Account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO Admin(Admin_name, Contact_no, Address,Total_user, Email)
values('Ram', 9934569889, '23-Behargao Street',0, 'Ram2334@gmail.com'),
('Preeti', 9877654438, '456 Shakti Khand-I Ghaziabad',0, 'Preeti1234@gmail.com'),
('Shyam', 7650432240, '56-Rajeev Khand Dholpur',0, 'Shyam1234@gmail.com');

INSERT INTO Admin_login_system(Login_ID, Login_password, admin_ID)
VALUES('Ramop', 'Ram@3000', '1'),
('Preet', 'Pr6854', '2'),
('Shyamxp', 'ss7849', '3');
/*
SELECT* FROM Admin;
SELECT* FROM Admin_login_system;
SELECT* FROM Account_login_system;
SELECT* FROM Accounts;

DROP DATABASE banksystem;
*/