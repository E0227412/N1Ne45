#Create Schema
CREATE SCHEMA `N1Ne45Stockists` ;

Use `N1Ne45Stockists`;
# Create Table role
CREATE TABLE `role` (
  `role_id` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)); 

# Create Table role
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL ,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`));
# Create Table user_role
CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
);
#Insert ADMIN 
INSERT INTO `role` VALUES ('1','ADMIN');
INSERT INTO `N1Ne45Stockists`.`user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES ('1', '1', 'test@test.com', 'root', 'root', 'Password');
INSERT INTO `N1Ne45Stockists`.`user_role` (`user_id`, `role_id`) VALUES ('1', '1');
# Create Table Parts
CREATE TABLE `Parts` (
  `PartNumber` VARCHAR(45)  NOT NULL,
  `PartName` VARCHAR(45) NOT NULL,
  `PartSupplierID` VARCHAR(45) NOT NULL,
  `PartQuantityPerUnit` INT NOT NULL DEFAULT 1,
  `PartUnitInStock` INT NOT NULL DEFAULT 10,
  `PartUnitOnOrder` INT NOT NULL DEFAULT 0,
  `PartReorderLevel` INT NOT NULL DEFAULT 5,
  `PartMinimumReorderQuantity` INT NOT NULL,
  `PartShelfLocation` VARCHAR(45) NOT NULL,
  `PartDiscontinued` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`PartNumber`));
  #Create Table Manufacturers
  CREATE TABLE `Suppliers` (
  `SupplierID` VARCHAR(45) NOT NULL,
  `SupplierName` VARCHAR(45) NOT NULL,
  `SupplierContactName` VARCHAR(45) NOT NULL,
  `SupplierContactTitle` VARCHAR(45) NOT NULL,
  `SupplierAddress` VARCHAR(45) NOT NULL,
  `SupplierPostalCode` VARCHAR(10) NOT NULL,
  `SupplierPhoneNumber` VARCHAR(10) NOT NULL,
  `SupplierFax` VARCHAR(45) NULL,
  PRIMARY KEY (`SupplierID`));
# Add FOREIGN KEY of Parts
ALTER TABLE Parts
ADD FOREIGN KEY (PartSupplierID) REFERENCES Suppliers(SupplierID);
#Create Table Orders
CREATE TABLE `Orders` (
  `OrderID` VARCHAR(45) NOT NULL,
  `OrderEmployeeID` VARCHAR(45) NOT NULL,
  `OrderSupplierID` VARCHAR(45) NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `OrderRequiredDate` DATETIME NOT NULL,
  `OrderArrivedDate` DATETIME NOT NULL,
  PRIMARY KEY (`OrderID`));
#Create Table OrderDetails
 CREATE TABLE `OrderDeatals` (
  `OrderID` VARCHAR(45) NOT NULL,
  `PartNumber` VARCHAR(45) NOT NULL,
  `PartUnitPrice` VARCHAR(45) NOT NULL,
  `PartQuantity` INT NOT NULL,
  `PartDiscount` VARCHAR(45) NOT NULL DEFAULT '1',
  `Reason` VARCHAR(45) NOT NULL,
  `ReasonDecription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderID`, `PartNumber`)); 
# Add FOREIGN KEY of OrderDeatals  
ALTER TABLE OrderDeatals
ADD FOREIGN KEY (`OrderID`) REFERENCES Orders(`OrderID`);
ALTER TABLE OrderDeatals
ADD FOREIGN KEY (`PartNumber`) REFERENCES Parts(`PartNumber`);
#Create Table Employees
CREATE TABLE `Employees` (
  `EmployeeID` VARCHAR(45) NOT NULL,
  `EmployeeLastName` VARCHAR(45) NOT NULL,
  `EmployeeFirstName` VARCHAR(45) NOT NULL,
  `EmployeeTitle` VARCHAR(45) NOT NULL,
  `EmployeeBirthDate` DATETIME NOT NULL,
  `EmployeeHireDate` DATETIME NOT NULL,
  `EmployeeAddress` VARCHAR(45) NOT NULL,
  `EmployeePostalCode` VARCHAR(10) NOT NULL,
  `EmployeePhoneNumber` VARCHAR(15) NOT NULL,
  `EmployeeSpecialization` VARCHAR(15) NOT NULL,
  `EmployeeReportTO` INT NULL,
  PRIMARY KEY (`EmployeeID`));
# Add FOREIGN KEY of Employees
# Add FOREIGN KEY of Orders
ALTER TABLE Orders
ADD FOREIGN KEY (`OrderEmployeeID`) REFERENCES Employees(`EmployeeID`);
#Create Table Customers
CREATE TABLE `Customers` (
  `CustomerID` VARCHAR(45) NOT NULL,
  `CustomerServiceEmployeeID` VARCHAR(45) NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `CustomerContactTite` VARCHAR(45) NOT NULL,
  `CustomerAddress` VARCHAR(45) NULL,
  `CustomerPostalCode` VARCHAR(45) NULL,
  `CustomerEmailAddress` VARCHAR(45) NULL,
  `CustomerPhoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`));
# Add FOREIGN KEY of Customers   
ALTER TABLE Customers
ADD FOREIGN KEY (`CustomerServiceEmployeeID`) REFERENCES Employees(`EmployeeID`);
  
