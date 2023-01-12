-- Group Project
-- Payroll Management System
-- Group 8

/******** Part I 
Creating PayrollManagementSystem Database &
Creating 12 Tables and Inserting Sample Data
********/

DROP DATABASE IF EXISTS PayrollManagementSystem;

CREATE DATABASE IF NOT EXISTS PayrollManagementSystem;

USE PayrollManagementSystem;

--
-- Table structure for table `Department`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Department`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Department` (
  `Department_ID`           int NOT NULL,
  `Name`                    varchar(45) NOT NULL,
  `Department_Description`  varchar(255) NOT NULL,
  PRIMARY KEY (`Department_ID`)
);

--
-- Inserting data into table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;

INSERT INTO `Department` 
VALUES 
	('1000','Marketing','Advertising and Marketing Analytics Department'),
	('2000','Engineering','Product Development and Engineering Department'),
	('3000','Finance','Treasury and Finance Operations Department'),
	('4000','Business Development','Sales and Customer Success Department'),
	('5000','Human Resources','Human Capital and Worker Compliance Department');
    
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Bank_Details`
--

SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee_Bank_Details`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Employee_Bank_Details` (
  `Bank_Details_ID`			int NOT NULL,
  `Routing_Number`			int NOT NULL,
  `Account_Number`			int NOT NULL,
  `Employee_Account_Name` 	varchar(45) NOT NULL,
  `Bank_Name`             	varchar(45) NOT NULL,
  `Account_Type`          	varchar(45) NOT NULL,
  `Currency_Type`			varchar(45) NOT NULL,
  PRIMARY KEY (`Bank_Details_ID`)
);

--
-- Inserting data into table `Employee_Bank_Details`
--
LOCK TABLES `Employee_Bank_Details` WRITE;

INSERT INTO `Employee_Bank_Details` 
VALUES 
	(1, 623852453, 830653269, 'paycheck', 'Chase', 'checking', 'USD'),
	(2, 041215032, 879577366, 'checks', 'Wells Fargo', 'checking', 'USD'),
	(3, 144115090, 305123779, 'pc', 'Citi', 'savings', 'USD'),
	(4, 341215016, 157595550, 'checking', 'Chase', 'checking', 'USD'),
	(5, 541215032, 112431849, 'acct', 'Bank of America', 'checking', 'USD');

UNLOCK TABLES;


--
-- Table structure for table `PTO`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `PTO`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `PTO` (
  `PTO_ID`        int NOT NULL,
  `PTO_Yearly`    decimal(6,2) NOT NULL,
  `PTO_Remaining` decimal(6,2) NOT NULL,
  PRIMARY KEY (`PTO_ID`)
);

--
-- Inserting data into table `PTO`
--
LOCK TABLES `PTO` WRITE;

INSERT INTO `PTO` 
VALUES 
	('10','80.00','20.00'),
	('20','80.00','40.00'),
	('30','80.00','60.00'),
	('40','80.00','80.00'),
	('50','80.00','50.00');

UNLOCK TABLES;

--
-- Table structure for table `Employee`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee`;
SET FOREIGN_KEY_CHECKS=1; 

CREATE TABLE `Employee` (
  `Employee_ID`         int NOT NULL,
  `First_Name`          varchar(25) NOT NULL,
  `Last_Name`           varchar(25) NOT NULL,
  `SSN`                 int NOT NULL,
  `Date_Of_Birth`       DATE NOT NULL,
  `Gender`              varchar(10) NOT NULL,
  `Marital_Status`      varchar(10) NOT NULL,
  `Address`             varchar(255) NOT NULL,
  `City`                varchar(45) NOT NULL,
  `State`               varchar(45) NOT NULL,
  `Country`             varchar(45) NOT NULL,
  `ZipCode`             varchar(9) NOT NULL,
  `Race`                varchar(25) NOT NULL,
  `Email`               varchar(25) NOT NULL,
  `Phone`               varchar(25) NOT NULL,
  `Start_Date`          DATE NOT NULL,
  `Bank_Details_ID`     int NOT NULL,
  `PTO_ID`              int NOT NULL,
  `Employment_Status`   varchar(45) NOT NULL,
  `Hourly_Rate`   		decimal(8,2) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Bank_Details_ID`) REFERENCES `Employee_Bank_Details` (`Bank_Details_ID`),
  FOREIGN KEY (`PTO_ID`) REFERENCES `PTO` (`PTO_ID`)
);

--
-- Inserting data into table `Employee`
--
LOCK TABLES `Employee` WRITE;

INSERT INTO `Employee` 
VALUES   
	(1, 'Mike','Johnson','123345678','1992-01-03','Male','Single','123 Blazer Trail','Waco','Texas','USA','75222','White','Mike.Johnson@utd.com','555-555-1234','2017-04-05','1', '10', 'Full Time','40'),
	(2, 'James','Sanders','123345678','1991-03-04','Male','Single','324 Elmwood Blvd','Dallas','Texas','USA','75146','African American','James.Sanders@utd.com','555-555-1235','2018-09-10','2', '20', 'Full Time','35'),
	(3, 'Christina','Moore','123345678','1990-02-05','Female','Married','1234 Ridgeway Dr','Austin','Texas','USA','75146','Asian','Christina.Moore@utd.com','555-555-1236','2015-05-06','3', '30', 'Full Time','45'),
	(4, 'Susan','Dixon','123345678','1995-07-08','Female','Single','908 W Lucille St','Los Angeles','California','USA','72169','White','Susan.Dixon@utd.com','555-555-1237','2017-06-07','4', '40', 'Full Time','38'),
	(5, 'Chelsea','Thompson', '123345679', '1993-08-09','Female','Married','184 Pine Ridge Ct','Denver','Colorado','USA','84994','African American','Chelsea.Thompson@utd.com','555-555-1238', '20190409', '5','50', 'Full Time','30');
    
UNLOCK TABLES;


--
-- Table structure for table `Position`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Position`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Position` (
  `Position_ID`   int NOT NULL,
  `Position_Name` varchar(45) NOT NULL,
  `Department_ID` int NOT NULL,
  PRIMARY KEY (`Position_ID`),
  FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`)
);

--
-- Inserting data into table `Position`
--
LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;

INSERT INTO `Position` 
VALUES 
	('1001','Director','1000'),
	('1002','Manager','1000'),
	('1003','Analyst','1000'),
	('2001','Director','2000'),
	('2002','Manager','2000'),
	('2003','Analyst','2000'),
	('3001','Director','3000'),
	('3002','Manager','3000'),
	('3003','Analyst','3000'),
	('4001','Director','4000'),
	('4002','Manager','4000'),
	('4003','Analyst','4000'),
	('5001','Director','5000'),
	('5002','Manager','5000'),
	('5003','Analyst','5000');

/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Employee_Position`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee_Position`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Employee_Position` (
  `Employee_ID`   int NOT NULL,
  `Position_ID`   int NOT NULL,
  `Supervisor_ID` int,
  `Start_Date`    DATE,
  `End_Date`      DATE,
  PRIMARY KEY (`Employee_ID`, `Position_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  FOREIGN KEY (`Position_ID`) REFERENCES `Position` (`Position_ID`)
);

--
-- Inserting data into table `Employee_Position`
--

LOCK TABLES `Employee_Position` WRITE;

INSERT INTO `Employee_Position` 
VALUES 
	(1, 1001, NULL, '2022-07-19', NULL),
    (2, 1002, 1, '2022-07-13', NULL),
    (3, 2003, 5, '2022-02-17', NULL),
    (4, 3001, NULL, '2002-11-14', NULL),
    (5, 2002, NULL, '2018-10-08', NULL),
    (1, 2003, 4, '2004-06-12', '2022-07-10');

UNLOCK TABLES;

--
-- Table structure for table `Employee_Hours_Worked`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee_Hours_Worked`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Employee_Hours_Worked` (
  `Hours_Worked_ID` int NOT NULL,
  `Employee_ID`     int NOT NULL,
  `Start_Date`      DATE,
  `End_Date`        DATE,
  `Regular_Hours`   decimal(4,2) NOT NULL,
  `Overtime_Hours`  decimal(4,2) NOT NULL,
  `Holiday_Hours`   decimal(4,2) NOT NULL,
  `Sick_Day_Hours`  decimal(4,2) NOT NULL,
  `PTO_Hours`       decimal(4,2) NOT NULL, -- create function to update remaining hours in PTO table.
  PRIMARY KEY (`Hours_Worked_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
);

--
-- Inserting data into table `Employee_Hours_Worked`
--

LOCK TABLES `Employee_Hours_Worked` WRITE;

INSERT INTO `Employee_Hours_Worked` 
VALUES 
	(1001, 1, '2022-06-13', '2022-06-26', 64, 0, 0, 8, 8),
	(2001, 2, '2022-06-13', '2022-06-26', 80, 4, 0, 0, 0),
	(3001, 3, '2022-06-13', '2022-06-26', 80, 2, 0, 16, 16),
	(4001, 4, '2022-06-13', '2022-06-26', 80, 0, 0, 8, 0),
	(5001, 5, '2022-06-13', '2022-06-26', 80, 5, 0, 0, 24),
    (1002, 1, '2022-06-27', '2022-07-10', 80, 3, 2, 8, 0),
	(2002, 2, '2022-06-27', '2022-07-10', 80, 1, 2, 0, 40),
	(3002, 3, '2022-06-27', '2022-07-10', 80, 4, 2, 8, 32),
	(4002, 4, '2022-06-27', '2022-07-10', 80, 7, 2, 0, 16),
	(5002, 5, '2022-06-27', '2022-07-10', 80, 2, 2, 0, 0);

UNLOCK TABLES;


--
-- Table structure for table `Taxes`
--

SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Taxes`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Taxes` (
  `Tax_Deduction_ID`      int NOT NULL,
  `Federal_Tax_%`         decimal(5,4) NOT NULL,
  `State_Tax_%`           decimal(5,4) NOT NULL,
  `Local_Tax_%`           decimal(5,4) NOT NULL,
  `Social_Security_Tax_%` decimal(5,4) NOT NULL,
  `Medicare_Tax_%`        decimal(5,4) NOT NULL,
  PRIMARY KEY (`Tax_Deduction_ID`)
);

--
-- Inserting data into table `Taxes`
--

LOCK TABLES `Taxes` WRITE;

INSERT INTO `Taxes` 
VALUES 
	(1, .10, .0625, .0924, .0620, .0145),
	(2, .12, .0315, .0176, .0620, .0145),
	(3, .12, .0315, .0840, .0620, .0145),
	(4, .15, .0250, .0947, .0620, .0145),
	(5, .10, .0875, .0480, .0620, .0145);

UNLOCK TABLES;


--
-- Table structure for table `Deductions`
--

SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Deductions`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Deductions` (
  `Deduction_ID`      int NOT NULL,
  `Tax_Deduction_ID`  int NOT NULL,
  `Health_Insurance`  decimal(5,4) NOT NULL,
  `401K`              decimal(5,4) NOT NULL,
  PRIMARY KEY (`Deduction_ID`),
  FOREIGN KEY (`Tax_Deduction_ID`) REFERENCES `Taxes` (`Tax_Deduction_ID`)
);

-- 
-- Inserting data into table `Deductions`
--
 
LOCK TABLES `Deductions` WRITE;

INSERT INTO `Deductions`
VALUES 
	(1, 4, .0510, .0500),
	(2, 2, .0460, .0850),
	(3, 1, .0510, .10),
	(4, 5, .0640, .15),
	(5, 3, .0510, .12);
    
UNLOCK TABLES;


--
-- Table structure for table `Employee_Deductions`
--

SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee_Deductions`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Employee_Deductions` (
  `Employee_ID`   int NOT NULL,
  `Deduction_ID`  int NOT NULL,
  `Start_Date`    DATE NOT NULL,
  `End_Date`      DATE NOT NULL,
  PRIMARY KEY (`Employee_ID`, `Deduction_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  FOREIGN KEY (`Deduction_ID`) REFERENCES `Deductions` (`Deduction_ID`)
);  

--
-- Inserting data into table `Employee_Deductions`
-- 
LOCK TABLES `Employee_Deductions` WRITE;

INSERT INTO `Employee_Deductions`
VALUES 
	(1,3, '2022-01-01', '2023-01-01'),
	(2,4, '2022-01-01', '2023-01-01'),
	(3,2, '2022-01-01', '2023-01-01'),
	(4,5, '2022-01-01', '2023-01-01'),
	(5,1, '2022-01-01', '2023-01-01');

UNLOCK TABLES;


--
-- Table structure for table `Employee_Bonuses`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Employee_Bonuses`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `Employee_Bonuses` (
  `Bonus_ID`    int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Bonus_Type`  varchar(45) NOT NULL,
  `Bonus_Amt`   decimal(18,2) NOT NULL,
  PRIMARY KEY (`Bonus_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
);  
 
-- 
-- Inserting data into table `Employee_Bonuses`
--

LOCK TABLES `Employee_Bonuses` WRITE;
INSERT INTO `Employee_Bonuses` VALUES 
	(1, 3, 'Profit-Sharing', 1500.00),
	(2, 4, 'Referal', 2500.00),
	(3, 2, 'Signing', 3000.00 ),
	(4, 5, 'Annual', 1000.00),
	(5, 1, 'Holiday', 500.00);
UNLOCK TABLES;


--
-- Table structure for table `Payroll`
--
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS `Payroll`;
SET FOREIGN_KEY_CHECKS=1; 

CREATE TABLE `Payroll` (
  `Payroll_ID`    int NOT NULL,
  `Employee_ID`   int NOT NULL,
  `Pay_Date`      DATE NOT NULL,
  `Start_Date`    DATE NOT NULL,
  `End_Date`      DATE NOT NULL,
  `Gross_Pay`     decimal(20,2),
  `Deductions`	  decimal(20,2),
  `Net_Pay`       decimal(20,2),
  `Bonus_ID`      int NOT NULL,
  `Deduction_ID`  int NOT NULL,
  PRIMARY KEY (`Payroll_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  FOREIGN KEY (`Employee_ID`, `Bonus_ID`) REFERENCES `Employee_Bonuses` (`Employee_ID`, `Bonus_ID`),
  FOREIGN KEY (`Employee_ID`, `Deduction_ID`) REFERENCES `Employee_Deductions` (`Employee_ID`, `Deduction_ID`)
) ;


-- 
-- Inserting data into table `Payroll`
--

LOCK TABLES `Payroll` WRITE;
INSERT INTO `Payroll` VALUES 
	(10000001, 1, '2022-06-27', '2022-06-13', '2022-06-26', NULL, NULL, NULL, 5, 3),
	(20000001, 2, '2022-06-27', '2022-06-13', '2022-06-26', NULL, NULL, NULL, 3, 4),
	(30000001, 3, '2022-06-27', '2022-06-13', '2022-06-26', NULL, NULL, NULL, 1, 2),
	(40000001, 4, '2022-06-27', '2022-06-13', '2022-06-26', NULL, NULL, NULL, 2, 5),
	(50000001, 5, '2022-06-27', '2022-06-13', '2022-06-26', NULL, NULL, NULL, 4, 1),
    (10000002, 1, '2022-07-11', '2022-06-27', '2022-07-10', NULL, NULL, NULL, 5, 3),
	(20000002, 2, '2022-07-11', '2022-06-27', '2022-07-10', NULL, NULL, NULL, 3, 4),
	(30000002, 3, '2022-07-11', '2022-06-27', '2022-07-10', NULL, NULL, NULL, 1, 2),
	(40000002, 4, '2022-07-11', '2022-06-27', '2022-07-10', NULL, NULL, NULL, 2, 5),
	(50000002, 5, '2022-07-11', '2022-06-27', '2022-07-10', NULL, NULL, NULL, 4, 1);
UNLOCK TABLES;

SELECT * FROM Payroll;

USE PayrollManagementSystem;

SHOW TABLES;




/******** Part II
Creating Three Stored Functions and One Stored Procedure Which Calls the Stored Functions to 
Fill the Values for `Gross_Pay`, `Deductions` and `Net_Pay` Fields in `Payroll` Table Automatically 
********/

--
-- Stored Function 1 -- Creating Stored Function get_gross_pay() to Calculate Gross Pay
--
USE PayrollManagementSystem;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_gross_pay;

DELIMITER //
CREATE FUNCTION get_gross_pay
(
Employee_ID_Var INT,
Payroll_Start_Date DATE,
Payroll_End_Date DATE
)
RETURNS DECIMAL(15, 2)
BEGIN
	DECLARE Employee_Gross_Pay DECIMAL(15, 2);
	SELECT E.Hourly_Rate * (EHW.Regular_Hours + EHW.Overtime_Hours - EHW.Sick_Day_Hours) 
    INTO Employee_Gross_Pay
    FROM Employee AS E
    INNER JOIN Employee_Hours_Worked AS EHW
    USING (Employee_ID)
	WHERE E.Employee_ID = Employee_ID_Var AND EHW.Start_Date = Payroll_Start_Date AND EHW.End_Date = Payroll_End_Date;
	RETURN(Employee_Gross_Pay);
END//

DELIMITER ;
    
-- Query 1 -- To Test Stored Function get_gross_pay()

SET @Employee_ID_Var := 2;
SET @Payroll_Start_Date := '2022-06-27';
SET @Payroll_End_Date := '2022-07-10';

SELECT get_gross_pay(@Employee_ID_Var, @Payroll_Start_Date, @Payroll_End_Date);



--
-- Stored Function 2 -- Creating Stored Function get_deductions() to Calculate Deductions
--
USE PayrollManagementSystem;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_deductions;

DELIMITER //
CREATE FUNCTION get_deductions
(
Employee_ID_Var INT,
Payroll_Start_Date DATE,
Payroll_End_Date DATE
)
RETURNS DECIMAL(15, 2)
BEGIN
	DECLARE Employee_Deduction_Amt DECIMAL(15, 2);
    SELECT DISTINCT get_gross_pay(Employee_ID_Var, Payroll_Start_Date, Payroll_End_Date) * (T.`Federal_Tax_%` + T.`State_Tax_%` + T.`Local_Tax_%` + T.`Social_Security_Tax_%` + T.`Medicare_Tax_%` + D.Health_Insurance + D.`401K`)
    INTO Employee_Deduction_Amt
    FROM Employee AS E
    INNER JOIN Employee_Deductions AS ED
    USING (Employee_ID) 
    INNER JOIN Deductions AS D
    USING (Deduction_ID)
    INNER JOIN Taxes AS T
    USING (Tax_Deduction_ID)
    WHERE E.Employee_ID = Employee_ID_Var;
	RETURN(Employee_Deduction_Amt);
END//

DELIMITER ;

-- Query 2 -- To Test Stored Function get_deductions()
SET @Employee_ID_Var := 2;
SET @Payroll_Start_Date := '2022-06-27';
SET @Payroll_End_Date := '2022-07-10';

UPDATE Payroll
SET Gross_Pay = get_gross_pay(@Employee_ID_Var, @Payroll_Start_Date, @Payroll_End_Date)
WHERE Employee_ID = @Employee_ID_Var AND Start_Date = @Payroll_Start_Date AND End_Date = @Payroll_End_Date;

Select * From Payroll;

--
-- Stored Function 3 -- Creating Stored Function get_net_pay() to Calculate Net Pay;
--
USE PayrollManagementSystem;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_net_pay;

DELIMITER //
CREATE FUNCTION get_net_pay
(
Employee_ID_Var INT,
Payroll_Start_Date DATE,
Payroll_End_Date DATE
)
RETURNS DECIMAL(15, 2)
BEGIN
	DECLARE Employee_Net_Pay DECIMAL(15, 2);
    SELECT DISTINCT get_gross_pay(Employee_ID_Var, Payroll_Start_Date, Payroll_End_Date) - get_deductions(Employee_ID, Payroll_Start_Date, Payroll_End_Date) + EB.Bonus_Amt 
    INTO Employee_Net_Pay
    FROM Employee AS E
    INNER JOIN Employee_Bonuses AS EB
    USING (Employee_ID)
    WHERE E.Employee_ID = Employee_ID_Var;
	RETURN(Employee_Net_Pay);
END//

DELIMITER ;

-- Query 3 -- To Test Stored Function get_net_pay()
SET @Employee_ID_Var := 1;
SET @Payroll_Start_Date1 := '2022-06-13';
SET @Payroll_End_Date1 := '2022-06-26';
SET @Payroll_Start_Date2 := '2022-06-27';
SET @Payroll_End_Date2 := '2022-07-10';

SELECT DISTINCT get_net_pay(@Employee_ID_Var, @Payroll_Start_Date1, @Payroll_End_Date1)
UNION
SELECT DISTINCT get_net_pay(@Employee_ID_Var, @Payroll_Start_Date2, @Payroll_End_Date2);


--
-- Stored Procedure 1 -- Creating Stored Procedure pay_calculation() to Fill the Values For `Gross_Pay`, `Deductions` and `Net_Pay` in `Payroll` Table
--
USE PayrollManagementSystem;

SET @Employee_ID_Min := (SELECT Employee_ID FROM Employee ORDER BY Employee_ID ASC LIMIT 1);
SET @Employee_ID_Max := (SELECT Employee_ID FROM Employee ORDER BY Employee_ID DESC LIMIT 1);
    
SET @Payroll_Start_Date_Min := (SELECT Start_Date FROM Payroll ORDER BY Start_Date ASC LIMIT 1);
SET @Payroll_Start_Date_Max := (SELECT Start_Date FROM Payroll ORDER BY Start_Date DESC LIMIT 1);
    
SET @Payroll_End_Date_Min := (SELECT End_Date FROM Payroll ORDER BY End_Date ASC LIMIT 1);
SET @Payroll_End_Date_Max := (SELECT End_Date FROM Payroll ORDER BY End_Date DESC LIMIT 1);

DROP PROCEDURE IF EXISTS pay_calculation;

DELIMITER //

CREATE PROCEDURE pay_calculation()

BEGIN
	DECLARE Employee_ID_Var INT DEFAULT @Employee_ID_Min;
    DECLARE Payroll_Start_Date DATE DEFAULT @Payroll_Start_Date_Min;
	DECLARE Payroll_End_Date DATE DEFAULT @Payroll_End_Date_Min;
    
    WHILE Employee_ID_Var <= @Employee_ID_Max DO
		WHILE Payroll_Start_Date <= @Payroll_Start_Date_Max DO
			UPDATE `Payroll`
				SET Gross_Pay = get_gross_pay(Employee_ID_Var, Payroll_Start_Date, Payroll_End_Date),
					Deductions = get_deductions(Employee_ID_Var, Payroll_Start_Date, Payroll_End_Date),
					Net_Pay = get_net_pay(Employee_ID, Payroll_Start_Date, Payroll_End_Date)
				WHERE Employee_ID = Employee_ID_Var AND Start_Date = Payroll_Start_Date AND End_Date = Payroll_End_Date;
			SET Payroll_Start_Date = ADDDATE(Payroll_Start_Date, INTERVAL 14 DAY);
            SET Payroll_End_Date = ADDDATE(Payroll_End_Date, INTERVAL 14 DAY);
		END WHILE;
		SET Employee_ID_Var = Employee_ID_Var + 1;
		SET Payroll_Start_Date = @Payroll_Start_Date_Min;
        SET Payroll_End_Date = @Payroll_End_Date_Min;
	END WHILE;
END //
DELIMITER ;

CALL pay_calculation();

Select * From Payroll;


/******** Part III
Alternative Way to Filling in the Values For `Gross_Pay`, `Deductions` and `Net_Pay` in `Payroll` Table:
Creating Views to Record Employee Gross Pay, Deductions, and Net Pay and Updating Data Based on Views 
********/

--
-- Creating VIEW 1 -- Gross_Pay_View
--
USE PayrollManagementSystem;

CREATE OR REPLACE VIEW Gross_Pay_View AS 
SELECT E.Employee_ID, EHW.Start_Date, EHW.End_Date, E.Hourly_Rate, (EHW.Regular_Hours + EHW.Overtime_Hours - EHW.Sick_Day_Hours) AS Total_Hours_Worked, 
	E.Hourly_Rate * (EHW.Regular_Hours + EHW.Overtime_Hours - EHW.Sick_Day_Hours) AS Gross_Pay
FROM Employee AS E
INNER JOIN Employee_Hours_Worked AS EHW
USING (Employee_ID);

SELECT * FROM Gross_Pay_View;


--
-- Creating VIEW 2 -- Deductions_View
--

USE PayrollManagementSystem;

CREATE OR REPLACE VIEW Deductions_View AS 
SELECT E.Employee_ID, GPV.Start_Date, GPV.End_Date, GPV.Gross_Pay, GPV.Gross_Pay * (T.`Federal_Tax_%` + T.`State_Tax_%` + T.`Local_Tax_%` + T.`Social_Security_Tax_%` + T.`Medicare_Tax_%` + D.Health_Insurance + D.`401K`) AS Employee_Deduction_Amt
    FROM Employee AS E
    INNER JOIN Gross_Pay_View AS GPV
    USING (Employee_ID)
    INNER JOIN Employee_Deductions AS ED
    USING (Employee_ID) 
    INNER JOIN Deductions AS D
    USING (Deduction_ID)
    INNER JOIN Taxes AS T
    USING (Tax_Deduction_ID);

SELECT * FROM Deductions_View;

--
-- Creating VIEW 3 -- Net_Pay_View
--

USE PayrollManagementSystem;

CREATE OR REPLACE VIEW Net_Pay_View AS 
SELECT DISTINCT E.Employee_ID, DV.Start_Date, DV.End_Date, DV.Gross_Pay, DV.Employee_Deduction_Amt, (DV.Gross_Pay - DV.Employee_Deduction_Amt + EB.Bonus_Amt) AS Net_Pay
FROM Employee AS E
INNER JOIN Employee_Bonuses AS EB
USING (Employee_ID)
INNER JOIN Deductions_VIEW AS DV
USING (Employee_ID);

SELECT * FROM Net_Pay_View;

-- Query 4 -- Updating Data for `Gross_Pay`, `Deductions` and `Net_Pay` Fields in `Payroll` Table 

SET SQL_SAFE_UPDATES = 0;

UPDATE `Payroll` P
INNER JOIN Net_Pay_View AS NPV
ON P.Employee_ID = NPV.Employee_ID AND P.Start_Date = NPV.Start_Date AND P.End_Date = NPV.End_Date
SET P.Gross_Pay = NPV.Gross_Pay, P.Deductions = NPV.Employee_Deduction_Amt, P.Net_Pay = NPV.Net_Pay;

SELECT * FROM Payroll;


/******** Part IV 
Creating Functions to Calculate Total Work Hours and Stored Procedures to Calculate Higest Paid Employee
Generating Querys To Calculate Net Salary by Department and by Position Each Two Weeks 
********/

--
-- Stored Function 4 -- Creating Function totalHours()
--

DROP FUNCTION IF EXISTS totalHours;
DELIMITER // 
CREATE FUNCTION totalHours 
( 
Employee_ID_param INT,
Start_Date_param DATE,
End_Date_param DATE 
) 
RETURNS DECIMAL(9,2)
BEGIN 
	DECLARE totalHours_var DECIMAL(9,2);
    SELECT (EHW.Regular_Hours + EHW.Overtime_Hours - EHW.Holiday_Hours - EHW.Sick_Day_Hours - EHW.PTO_Hours)
    INTO totalHours_var 
    FROM Employee_Hours_Worked AS EHW
    WHERE Employee_ID=Employee_ID_param AND Start_Date = Start_Date_param AND End_Date = End_Date_param;
    RETURN totalHours_var; 
END//

DELIMITER ;

-- Query 5 -- Testing totalHours Function
SELECT totalHours(1, '2022-06-13', '2022-06-26');


--
-- Stored Procedure 2 -- Creating Stored Procedure HighestPaidEmployee()
--
DROP PROCEDURE IF EXISTS HighestPaidEmployee;

DELIMITER //
CREATE PROCEDURE HighestPaidEmployee()
BEGIN
    WITH CTE AS
	(SELECT E.Employee_ID AS EmployeeID,
	CONCAT(E.First_Name, " ", E.Last_Name) AS Employee,
	D.Department_ID AS DepartmentID,
	D.`Name` AS Department,
	P.Gross_Pay AS Salary,
	DENSE_RANK() OVER (PARTITION BY D.Department_ID ORDER BY P.Gross_Pay DESC) AS rank_result
	FROM Employee AS E
	INNER JOIN Payroll AS P
	USING (Employee_ID)
    INNER JOIN Employee_Position AS EP
    USING (Employee_ID)
	INNER JOIN Position AS PO
	USING (Position_ID)
	INNER JOIN Department AS D
	USING (Department_ID))
	SELECT Department, Employee, Salary
	FROM CTE
	WHERE rank_result = 1;
END //

DELIMITER ;

CALL HighestPaidEmployee();

--
-- Query 6 -- To Calculate Net Salary by Department Each Two Weeks;
--
USE PayrollManagementSystem;

SELECT D.Department_ID, D.`Name` AS Department_Name, AVG(PA.Net_Pay)
FROM Payroll AS PA
INNER JOIN Employee_Position AS EP
USING (Employee_ID)
INNER JOIN Position AS PO
USING (Position_ID)
INNER JOIN Department AS D
USING (Department_ID)
WHERE EP.Start_Date <= PA.Start_Date AND EP.End_Date >= PA.End_Date
GROUP BY (D.Department_ID);

--
-- Query 7 -- To Calculate Net Salary by Position;
--
USE PayrollManagementSystem;

SELECT PO.Position_ID, PO.Position_Name, AVG(PA.Net_Pay)
FROM Payroll AS PA
INNER JOIN Employee_Position AS EP
USING (Employee_ID)
INNER JOIN Position AS PO
USING (Position_ID)
WHERE EP.Start_Date <= PA.Start_Date AND EP.End_Date >= PA.End_Date
GROUP BY PO.Position_ID;



/******** Part V
Creating Triggers To Check and Update PTO Hours 
********/

-- 
-- Trigger 1: Check to see if the remaining PTO is enough for the requested amount before inserting data.
-- 
USE PayrollManagementSystem;

DROP TRIGGER IF EXISTS Check_Remaining_PTO_Hours_Before_Insert;

DELIMITER $$
CREATE TRIGGER Check_Remaining_PTO_Hours_Before_Insert
    BEFORE INSERT
    ON Employee_Hours_Worked FOR EACH ROW
BEGIN
	DECLARE remaining_pto decimal(4,2);
    DECLARE pto_id_t int;
    
    Select DISTINCT PTO_Remaining, PTO_ID
    INTO remaining_pto, pto_id_t
    FROM Employee_Hours_Worked
		INNER JOIN Employee
			USING(Employee_ID)
		INNER JOIN PTO
			USING(PTO_ID)
	WHERE
        Employee_ID = NEW.Employee_ID;

	If remaining_pto < New.PTO_Hours THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT =
				'Employee does not have sufficient PTO hours remaining.';
    Else
		Update PTO
        SET PTO_Remaining = PTO_Remaining - NEW.PTO_Hours
		WHERE
			PTO_ID = pto_id_t;
	END IF;
END$$
DELIMITER ;


-- Query 8 -- To Check to see if Trigger 1 has executed correctly.
INSERT INTO `Employee_Hours_Worked` 
VALUES 
    (1022, 2, '2022-06-27', '2022-07-10', 80.00, 7.00, 2.00, 0.00, 2.00);

INSERT INTO `Employee_Hours_Worked`
VALUES
    (2023, 2, '2022-07-11', '2022-07-24', 51.00, 7.00, 2.00, 0.00, 20.00); 


-- 
-- Trigger 2: To Check if the remaining PTO is enough for the requested amount before updating data.
-- 
USE PayrollManagementSystem;

DROP TRIGGER IF EXISTS Check_Remaining_PTO_Hours_Before_Update;

DELIMITER $$
CREATE TRIGGER Check_Remaining_PTO_Hours_Before_Update
    BEFORE UPDATE
    ON Employee_Hours_Worked FOR EACH ROW
BEGIN
	DECLARE remaining_pto decimal(4,2);
    DECLARE pto_id_t int;
    
    SELECT DISTINCT PTO_Remaining, PTO_ID
    INTO remaining_pto, pto_id_t
    FROM Employee_Hours_Worked
		INNER JOIN Employee
			USING(Employee_ID)
		INNER JOIN PTO
			USING(PTO_ID)
	WHERE
        Employee_ID = NEW.Employee_ID;

	If remaining_pto + OLD.PTO_Hours < New.PTO_Hours THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT =
				'Employee does not have sufficient PTO hours remaining.';
    Else
		Update PTO
        SET PTO_Remaining = PTO_Remaining + OLD.PTO_Hours - NEW.PTO_Hours
		WHERE
			PTO_ID = pto_id_t;
	END IF;
END$$
DELIMITER ;

-- Query 9 -- To Check if Trigger 2 has executed correctly.
UPDATE `Employee_Hours_Worked` 
SET
	PTO_Hours = 5
WHERE Hours_Worked_ID = 3002 AND Employee_ID = 3 AND Start_Date = '2022-06-27' AND End_Date = '2022-07-10';

# If changing PTO_Hours = 50, the trigger will arouse an error if PTO_Hours is larger thant the remaining PTO which testifies the trigger work well


/******** Part VI
Creating Procedures To Create New Employee Record and Its Dependencies, including PTO, Employee Bank Details, etc.
********/

--
-- Stored Procedure 3 -- Creating Stored Procedure Create_New_PTO_Record()
--

USE PayrollManagementSystem;

DROP PROCEDURE IF EXISTS Create_New_PTO_Record;

DELIMITER $$

CREATE PROCEDURE Create_New_PTO_Record(
	IN PTO_ID int,
    IN PTO_Yearly decimal(4,2),
    IN PTO_Remaining decimal(4,2)
)
BEGIN
	IF PTO_Yearly is NULL then SET PTO_Yearly = 80.00;
	END IF;
    
    IF PTO_Remaining is NULL then SET PTO_Remaining = 80.00;
    END IF;
    
    INSERT INTO PTO
    VALUES
		(PTO_ID, PTO_Yearly, PTO_Remaining);
    
END $$

DELIMITER ;


--
-- Stored Procedure 4 -- Creating Stored Procedure Create_New_Emp_Bank_Details_Record()
--

DELIMITER $$

CREATE PROCEDURE Create_New_Emp_Bank_Details_Record(
	IN Bank_Details_ID			int,
	IN Routing_Number			int,
	IN Account_Number			int,
	IN Employee_Account_Name 	varchar(45),
	IN Bank_Name            	varchar(45),
	IN Account_Type          	varchar(45),
	IN Currency_Type			varchar(45)
)
BEGIN
	INSERT INTO Employee_Bank_Details
    VALUES
		(Bank_Details_ID, Routing_Number, Account_Number,
        Employee_Account_Name, Bank_Name, Account_Type, Currency_Type);
END $$

DELIMITER ;


--
-- Stored Procedure 5 -- Creating Stored Procedure Create_New_Employee()
--

DROP PROCEDURE IF EXISTS Create_New_Employee;

DELIMITER $$
CREATE PROCEDURE Create_New_Employee(
    IN First_Name		varchar(25),
	IN Last_Name		varchar(25),
    IN SSN				int,
    IN Date_Of_Birth	DATE,
    IN Gender			varchar(10),
    IN Marital_Status	varchar(10),
    IN Address			varchar(255),
	IN City				varchar(45),
    IN State			varchar(45),
    IN Country			varchar(45),
    IN ZipCode			varchar(9),
    IN Race				varchar(25),
    IN Email			varchar(25),
    IN Phone			varchar(25),
    IN Start_Date		DATE,
    IN Routing_Number	int,
    IN Account_Number	int,
    IN emp_status		varchar(45),
    IN Hourly_Rate		decimal(8,2)
)
BEGIN
	Declare new_employee_ID, new_pto_ID, new_bank_details_ID int;
	 
	Select 
		max(e.Employee_ID) + 1,
        max(p.PTO_ID) + 1,
        max(emb.Bank_Details_ID) + 1
	Into 
		new_employee_ID, new_pto_ID, new_bank_details_ID
	from 
		Employee as e, 
        PTO as p, 
        Employee_Bank_Details as emb;
	
	CALL Create_New_PTO_Record (new_pto_ID, NULL, NULL);
    
    CALL Create_New_Emp_Bank_Details_Record(
		new_bank_details_ID,
		Routing_Number,
        Account_Number, 
        concat(First_Name, "'s account"),
		concat(First_Name, "'s bank"), 
        "Checking", 
        "USD"
	);
    
	Insert Into Employee
	Values (new_employee_ID, First_Name, Last_Name,
		SSN, Date_Of_Birth, Gender, Marital_Status,
        Address, City, State, Country, ZipCode, Race,
        Email, Phone, Start_Date, new_bank_details_ID,
        new_pto_ID, Emp_Status, Hourly_Rate);
End $$
DELIMITER ;

SELECT * FROM Employee;

CALL Create_New_Employee("Mike", "Tyson", 435412234, '1978-05-22',
'Male', 'Single', '217 KickButt Way', 'Los Angeles', 'Callifornia',
'USA', '91245', 'African American', 'mike.tyson@gmail.com', 
'213-877-4625', '2017-06-19', 173554781, 188037542, 'Full Time', 78.50);


-- Query 10 -- To Check the Updates on all fields from Employee, Employee_Bank_Details, and PTO Tables

SELECT * 
FROM Employee
INNER JOIN PTO
USING (PTO_ID)
INNER JOIN Employee_Bank_Details
USING (Bank_Details_ID);

SHOW TABLES;


/********  Part VII Creating an Event that Anually reloads 80 hours of PTO for all Employees with a PTO_ID.  Max PTO balance allowed is 120 hours ********/

DROP EVENT IF EXISTS PTO_ANNUAL_RESET;

DELIMITER $$
CREATE EVENT PTO_ANNUAL_RESET
	ON SCHEDULE EVERY 1 year
	STARTS CONCAT(EXTRACT(YEAR FROM now())+1,'-','01','-','01')
COMMENT 'Reloads 80 PTO hrs Anually if employee reloaded balance < 120'

DO
	BEGIN
     
   DROP TEMPORARY TABLE IF EXISTS `PTO_ANNUAL_RESET`;
    
   CREATE TEMPORARY TABLE `PTO_ANNUAL_RESET` (
  `TPTO_ID`            int NOT NULL,
  `TPTO_ANNUAL_RESET`  decimal(6,2) NOT NULL,
   PRIMARY KEY (`TPTO_ID`));
	
	INSERT INTO PTO_ANNUAL_RESET (TPTO_ID,TPTO_ANNUAL_RESET)
    SELECT PTO_ID, PTO_YEARLY+PTO_REMAINING
    FROM PTO;
    
    UPDATE PTO
	INNER JOIN
	PTO_ANNUAL_RESET ON PTO.PTO_ID = PTO_ANNUAL_RESET.TPTO_ID
	SET PTO_REMAINING = TPTO_ANNUAL_RESET
    WHERE TPTO_ANNUAL_RESET < 120;
    
    UPDATE PTO
	INNER JOIN
	PTO_ANNUAL_RESET ON PTO.PTO_ID = PTO_ANNUAL_RESET.TPTO_ID
	SET PTO_REMAINING = 120
    WHERE TPTO_ANNUAL_RESET >= 120;
       
    DROP TEMPORARY TABLE IF EXISTS `PTO_ANNUAL_RESET`;
    
	END $$
    
DELIMITER ; 

/*Check to see if the Event has added correctly with correct starting date of first day of following year*/

SHOW EVENTS;