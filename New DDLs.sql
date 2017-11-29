CREATE TABLE comments (
  commentID VARCHAR(10) NOT NULL PRIMARY KEY,
  commentTime VARCHAR(10) DEFAULT NULL,
  commentDate VARCHAR(10) DEFAULT NULL,
  type VARCHAR(10),
  description VARCHAR(250) NOT NULL); 
  
   CREATE TABLE customers (
  customerID VARCHAR(10) NOT NULL PRIMARY KEY,
  customerTitle VARCHAR(20) NOT NULL ,
  businessName VARCHAR(20) NOT NULL ,
  billingAddress VARCHAR(50) NOT NULL ,
  city VARCHAR (15) NOT NULL ,
  state VARCHAR (15) NOT NULL ,
  postalCode VARCHAR(5) NOT NULL ,
  country VARCHAR(15) NOT NULL ,
  phoneNumber VARCHAR(10) NOT NULL ,
  cellNumber VARCHAR(10) NOT NULL ,
  faxNumber VARCHAR(10) NOT NULL ,
  emailID VARCHAR(50) NOT NULL ,
  type VARCHAR(20) NOT NULL,
  companyName VARCHAR (20) NOT NULL,
  contactName VARCHAR (20) NOT NULL,
  alternateContactName VARCHAR (20) DEFAULT NULL,
  dateEntered VARCHAR(10));

CREATE TABLE employees (
  employeeID VARCHAR(10) PRIMARY KEY NOT NULL ,
  firstName VARCHAR(20) NOT NULL ,
  lastName VARCHAR(20) NOT NULL ,
  emailId VARCHAR(50) NOT NULL ,
  extension VARCHAR(11) NOT NULL ,
  homePhone VARCHAR(10) NOT NULL ,
  cellPhone VARCHAR(10) NOT NULL ,
  jobTitle VARCHAR(20) NOT NULL ,
  SSN VARCHAR(9) NOT NULL ,
  driverLicenseNum VARCHAR(15) NOT NULL ,
  streetAddress VARCHAR(50) NOT NULL ,
  city VARCHAR(15) NOT NULL ,
  state VARCHAR(15) NOT NULL ,
  postalCode VARCHAR(5) NOT NULL ,
  birthDate VARCHAR(10),
  dateHire VARCHAR(10) NOT NULL, 
  salary VARCHAR(7) NOT NULL,
  notes VARCHAR(100)) ;
  
  CREATE TABLE expenses (
  expenseID VARCHAR(10) PRIMARY KEY NOT NULL ,
  employeeID VARCHAR(10) NOT NULL ,
  expenseType VARCHAR(15) NOT NULL ,
  purposeofExpense VARCHAR(100) NOT NULL ,
  amountSpent VARCHAR(7) NOT NULL ,
  description VARCHAR(100) NOT NULL ,
  datePurchased VARCHAR(10) NOT NULL ,
  dateSubmitted VARCHAR(10) NOT NULL ,
  advanceAmount VARCHAR(7) NOT NULL ,
  paymentMethod VARCHAR(10) NOT NULL,
  FOREIGN KEY (employeeID) REFERENCES employees(employeeID)) ;
  
  CREATE TABLE orders (
  orderID VARCHAR(10) PRIMARY KEY NOT NULL ,
  orderDate VARCHAR(10) NOT NULL,
  customerID VARCHAR(10) NOT NULL ,
  employeeID VARCHAR(10) NOT NULL ,
  truckNo VARCHAR(10) NOT NULL ,
  isSpecial VARCHAR(3) NOT NULL ,
  pon VARCHAR(11) NOT NULL ,
  orderTotalAmount VARCHAR(7) NOT NULL ,
  FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
  FOREIGN KEY (customerID) REFERENCES customers(customerID)) ;


CREATE TABLE invoices (
  invoiceID VARCHAR(10) PRIMARY KEY NOT NULL ,
  orderID VARCHAR(10) NOT NULL ,
  employeeID VARCHAR(10) NOT NULL ,
  customerID VARCHAR(10) NOT NULL ,
  invoiceAmount VARCHAR(7) NOT NULL ,
  FOREIGN KEY (orderID) REFERENCES orders(orderID),
  FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
  FOREIGN KEY (customerID) REFERENCES customers(customerID)) ;

CREATE TABLE locations (
  locID VARCHAR(10) PRIMARY KEY NOT NULL ,
  locName VARCHAR(20) NOT NULL ,
  locCode VARCHAR(11) NOT NULL ,
  isAuction VARCHAR(3) NOT NULL ,
  customerID VARCHAR(10) NOT NULL ,
  addressStreet1 VARCHAR(50) NOT NULL ,
  addressStreet2 VARCHAR(50) DEFAULT NULL ,
  city VARCHAR(15) NOT NULL ,
  state VARCHAR(15) NOT NULL ,
  postalCode VARCHAR(5) NOT NULL ,
  country VARCHAR(15) NOT NULL ,
  locContactName VARCHAR (20) NOT NULL,
  locPhoneNumber VARCHAR(10) NOT NULL,
  locFaxNumber VARCHAR(10) NOT NULL,
  locEmail VARCHAR(50) NOT NULL,
   FOREIGN KEY (customerID) REFERENCES customers(customerID)) ;
   
   CREATE TABLE pricing (
  priceID VARCHAR(10) PRIMARY KEY NOT NULL ,
  locationIDFrom VARCHAR(11) NOT NULL ,
  locationIDTo VARCHAR(11) NOT NULL ,
  price VARCHAR(7) NOT NULL ,
  locationCodeFrom VARCHAR(11) DEFAULT NULL,
  locationCodeTo VARCHAR(11) DEFAULT NULL,
  locationNameFrom VARCHAR(20) NOT NULL ,
  locationNameTo VARCHAR(20) NOT NULL ,
  customerID VARCHAR(10) NOT NULL ,
   FOREIGN KEY (customerID) REFERENCES customers(customerID)) ;

CREATE TABLE transactions (
  transactionID VARCHAR(10) PRIMARY KEY NOT NULL,
  orderID VARCHAR(10) NOT NULL,
  priceID VARCHAR(10) NOT NULL,
  transactionDate VARCHAR(10) NOT NULL,
  transactionDesc VARCHAR(100) NOT NULL,
  transactionAmount VARCHAR(7) NOT NULL,
  make VARCHAR(20) NOT NULL,
  model VARCHAR(20) NOT NULL,
  year VARCHAR(4) DEFAULT NULL,
  employeeID VARCHAR(10) NOT NULL,
  truckNo VARCHAR(10) NOT NULL,
  discount VARCHAR (5) DEFAULT NULL,
  quantity VARCHAR (5),
  unitprice VARCHAR (15) NOT NULL,
  driverprice VARCHAR (10) NOT NULL,
  vin VARCHAR (20) NOT NULL,
  runnumber VARCHAR (10) DEFAULT NULL,
  isSpecial VARCHAR (3) NOT NULL,
  rate VARCHAR (5) NOT NULL,
  surcharge VARCHAR(5) DEFAULT NULL,
  FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
  FOREIGN KEY (priceID) REFERENCES pricing (priceID));

CREATE TABLE payments (
  paymentID VARCHAR(10) PRIMARY KEY NOT NULL ,
  orderID VARCHAR(10) NOT NULL ,
  transactionID VARCHAR(10) NOT NULL ,
  paymentMethodID VARCHAR(10) NOT NULL ,
  paymentAmount VARCHAR(7) NOT NULL ,
  paymentDate VARCHAR(10) NOT NULL ,
  checkNumber VARCHAR(10) DEFAULT NULL,
  creditCardNumber VARCHAR(20) DEFAULT NULL,
  cardholdersName VARCHAR(50),
  creditCardExpDate VARCHAR(7),
  cVV VARCHAR(3),
  FOREIGN KEY (orderID) REFERENCES orders(orderID),
  FOREIGN KEY (transactionID) REFERENCES transactions(transactionID)) ;

CREATE TABLE tickets (
  ticketID VARCHAR(10) PRIMARY KEY NOT NULL,
  employeeID VARCHAR(10) NOT NULL ,
  ticketDate VARCHAR(10) NOT NULL ,
  reason VARCHAR(100) NOT NULL ,
  amount VARCHAR(7) NOT NULL ,
  isPaid VARCHAR(3) NOT NULL );

CREATE TABLE trucks (
  truckNo VARCHAR(10) PRIMARY KEY NOT NULL,
  make VARCHAR(20) NOT NULL,
  model VARCHAR(20) NOT NULL,
  year VARCHAR(4) NOT NULL,
  licenseplateNo VARCHAR(10) NOT NULL,
  employeeID VARCHAR(10) NOT NULL,
  color VARCHAR(15) NOT NULL,
  VIN VARCHAR(20) NOT NULL,
  truckCost VARCHAR(7) NOT NULL,
   FOREIGN KEY (employeeID) REFERENCES employees(employeeID));

CREATE TABLE vehicles (
  vehicleID VARCHAR(10) PRIMARY KEY NOT NULL,
  make VARCHAR(20) NOT NULL,
  year VARCHAR(4) NOT NULL,
  model VARCHAR(20) NOT NULL,
  licenseplateNo VARCHAR(10) NOT NULL,
  color VARCHAR(15) NOT NULL,
  VIN VARCHAR(20) NOT NULL) ;