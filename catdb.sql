CREATE DATABASE catcafe;

CREATE TABLE catcafe.dbo.CafeInventory
(
  ItemId Int PRIMARY KEY, 
  ItemName Varchar(50),
  Stock Int
);

CREATE TABLE catcafe.dbo.Ingredients
(
  IngredientName Varchar(255) PRIMARY KEY,
  calories Int NOT NULL,
  carbohydrates Int NOT NULL, 
  protein Int NOT NULL, 
  fat Int NOT NULL, 
  amount_in_stock Int, 
  is_known_allergen BIT NOT NULL

);

CREATE TABLE catcafe.dbo.Employee_pay
(
  employeeID Int PRIMARY KEY, 
  pay_rate Money NOT NULL, 
  year_to_date Money NOT NULL, 
  health_insurance Money NOT NULL, 
  income_tax FLOAT Not NULL, 
  social_security_tax FLOAT NOT NULL 
);

CREATE TABLE catcafe.dbo.Schedule
(
  employeeID Int PRIMARY KEY,
  cafe_or_adoptions Varchar(10), 
  availibility Varchar(7)
);

CREATE TABLE catcafe.dbo.Employee
(
  employee_id Int PRIMARY KEY, 
  first_name varchar(50) NOT NULL, 
  last_name varchar(50) NOT NULL, 
  street_address varchar(50) NOT NULL, 
  city varchar(50) NOT NULL, 
  zip_code varchar(50) NOT NULL,
  phone_number varchar(10) NOT NULL, 
  job_description varchar(150) NOT NULL, 
  is_manager BIT NOT NULL, 
  is_volunteer BIT NOT NULL, 
  sick_days_left Int NOT NULL, 
  vacation_days_left Int NOT NULL, 
);


CREATE TABLE catcafe.dbo.CafeMenu
(
  menu_Item Int PRIMARY KEY, 
  itemId int,
  IngredientName varchar(50),
  estimated_calories Int NOT NULL,
  price Money NOT NULL,
  FOREIGN KEY (IngredientName) REFERENCES Ingredients(IngredientName),
  FOREIGN KEY (itemId) REFERENCES CafeInventory(itemId)
);

CREATE TABLE catcafe.dbo.CafePurchases
(
  purchase_id int PRIMARY KEY, 
  menu_item varchar(50),
  membershipID Int,
  employee_id Int,
  date DateTime NOT NULL,
  tax Money NOT NULL, 
  total Money NOT NULL, 
  FOREIGN KEY (menu_item) REFERENCES CafeMenu(menu_item),
  FOREIGN KEY (membershipId) REFERENCES MemberSignup(membershipId),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
);

CREATE TABLE catcafe.dbo.Adoptions
(
  adoptionID Int PRIMARY KEY, 
  membershipID  Int,
  employee_id Int,
  cat_id Int,
  adoption_fee Money NOT NULL, 
  date DateTime,
  FOREIGN KEY (cat_id) REFERENCES Cats(cat_id),
  FOREIGN KEY (membershipID) REFERENCES MembershipSignup(membershipID),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE catcafe.dbo.MembershipSignup
(
membershipID Int PRIMARY KEY, 
first_name varchar(50) NOT NULL, 
last_name varchar(50) NOT NULL, 
phone_number varchar(10) NOT NULL, 
street_address varchar(50) NOT NULL, 
city varchar(50) NOT NULL, 
state varchar(50) NOT NULL, 
zip_code varchar(8) NOT NULL, 
);

CREATE TABLE catcafe.dbo.Veterenarians
(
  vetID Int PRIMARY KEY, 
  first_name varchar(50) NOT NULL, 
  last_name varchar(50) NOT NULL, 
  office_number varchar(10) NOT NULL,
);

CREATE TABLE catcafe.dbo.Cats
(
  cat_id Int PRIMARY KEY, 
  cat_name varchar(50) NOT NULL, 
  cat_breed varchar(20), 
  cat_health varchar(255), 
  vetID Int, 
  FOREIGN KEY (vetID) REFERENCES Veterenarians(vetID) 
);
