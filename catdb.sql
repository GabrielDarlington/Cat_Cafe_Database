-- CREATE DATABASE catcafe;

CREATE TABLE catcafe.dbo.MemberSignup -- data added
(
membershipID Int Identity(1000,1) PRIMARY KEY,
first_name varchar(50) NOT NULL, 
last_name varchar(50) NOT NULL, 
phone_number varchar(10) NOT NULL, 
street_address varchar(50) NOT NULL, 
city varchar(50) NOT NULL, 
state varchar(50) NOT NULL, 
zip_code varchar(8) NOT NULL
);

CREATE TABLE catcafe.dbo.Employee -- data added
(
  employee_id Int Identity(100,10) PRIMARY KEY,
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
  vacation_days_left Int NOT NULL 
);

CREATE TABLE catcafe.dbo.Ingredients
(
  ingredient_name Varchar(255) PRIMARY KEY,
  calories Int NOT NULL,
  carbohydrates Int NOT NULL,
  protein Int NOT NULL,
  fat Int NOT NULL,
  amount_in_stock Int, 
  is_known_allergen bit NOT NULL,
);

CREATE TABLE catcafe.dbo.Recipes
(
  item_name Varchar(50) PRIMARY KEY,
  price Money, 
  serving_Size Int,
  calories_per_serving Int NOT NULL,
);

CREATE TABLE cacafe.dbo.RecipeIngredients
(
  item_id Int Identity(1,1),
  ingredient_name Varchar(255),
  item_name Varchar(50),
  quantity Int NOT NULL,
  calories Int NOT NULL,
  FOREIGN KEY (ingredient_name) REFERENCES Ingredients(ingredient_name),
  FOREIGN KEY (item_name) REFERENCES Recipes(item_name)
);

CREATE TABLE catcafe.dbo.Employee_pay -- data added
(
  employee_id Int,
  pay_rate Money NOT NULL,
  year_to_date Money NOT NULL,
  health_insurance Money NOT NULL,
  income_tax FLOAT NOT NULL,
  social_security_tax FLOAT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE catcafe.dbo.Schedule -- data added
(
  employee_id Int PRIMARY KEY,
  cafe_or_adoptions VARCHAR(10),
  availibility Varchar(7)
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE catcafe.dbo.CafeMenu
(
  menu_Item varchar(50) PRIMARY KEY,
  itemId int,
  ingredient_name varchar(255),
  estimated_calories Int NOT NULL, 
  price Money NOT NULL, 
  FOREIGN KEY (ingredient_name) REFERENCES Ingredients(ingredient_name),
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
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE catcafe.dbo.Veterenarians -- data added
(
  vetID Int PRIMARY KEY,
  first_name varchar(50) NOT NULL, 
  last_name varchar(50) NOT NULL, 
  office_number varchar(10) NOT NULL
);

CREATE TABLE catcafe.dbo.Cats -- data added
(
  cat_id Int PRIMARY KEY,
  cat_name varchar(50) NOT NULL, 
  cat_breed varchar(20),
  cat_health varchar(255),
  vetID Int,
  FOREIGN KEY (vetID) REFERENCES Veterenarians(vetID) 
);

CREATE TABLE catcafe.dbo.Adoptions -- data added
(
  adoptionID Int PRIMARY KEY,
  membershipID Int,
  employee_id Int,
  cat_id Int,
  adoption_fee Money NOT NULL, 
  adoption_date DateTime,
  FOREIGN KEY (cat_id) REFERENCES cats(cat_id),
  FOREIGN KEY (membershipId) REFERENCES MemberSignup(membershipId),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);



