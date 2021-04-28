-- In your CompanyDatabase, add a table named Departments with the following columns:
-- Id as a primary key
-- DepartmentName as text
-- Building as text
CREATE TABLE "Departments" (
  "Id"               SERIAL PRIMARY KEY,
  "DepartmentName"   TEXT,
  "Building"  		 TEXT
);

-- Add a Foreign key DepartmentId to your Employees Table. If you have trouble, 
-- remove the existing employees by running truncate table "Employees".
ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

-- Add table Products.
-- Products should have the columns
-- Id as a primary key
-- Price as a data type that can store a number with decimal places (e.g. 45.12)
-- Name as textual data
-- Description as textual data
-- QuantityInStock as a data type that can store a number WITHOUT decimal places (e.g. 42)
CREATE TABLE "Products" (
  "id"              SERIAL PRIMARY KEY,
  "Price"           DECIMAL,
  "Name"            TEXT,
  "Description"     TEXT,
  "QuantityInStock" INT
);

-- Add table Orders.
-- Orders should have the columns
-- Id as a primary key
-- OrderNumber as textual data
-- DatePlaced as a data type that can store a date (with Year, Month, and Day) -- or one with hours, minutes, and seconds. Student's choice.
-- Email as textual data
CREATE TABLE "Orders" (
  "id"          SERIAL PRIMARY KEY,
  "OrderNumber" TEXT,
  "DatePlaced"  DATE,
  "Email"       TEXT
);


-- In our company, one Order can have many Products and one Product can have many Orders. This will be a Many-to-Many relationship. 
-- Create the necessary table ProductOrders, foreign keys, and the OrderQuantity field needed for this to happen.
CREATE TABLE "ProductOrders" (
"id"			SERIAL PRIMARY KEY,
"OrderQuantity" INT,
"OrderId"		INTEGER REFERENCES "Orders" ("id"),
"ProductId"		INTEGER REFERENCES "Products" ("id")
);

--  Create queries that can do the following:

-- Insert the following Departments
-- Department Name	Building
-- Development	Main
-- Marketing	North
INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');


-- Insert the following Employees
-- FullName	Salary	JobPosition	PhoneExtension	IsPartTime	Department Id
-- Tim Smith	40000	Programmer	123	false	1
-- Barbara Ramsey	80000	Manager	234	false	1
-- Tom Jones	32000	Admin	456	true	2
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', 40000, 'Programer', 123, 'No', 2);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manger', 234, 'No', 2);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, 'Yes', 3);


-- Insert the following Products
-- Price	Name	Description	QuantityInStock
-- 12.45	Widget	The Original Widget	100
-- 99.99	Flowbee	Perfect for haircuts	3
INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);

--  Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com"
INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01', 'person@example.com');

--  Add an order quantity of 3 for the product named Widget to the order X529
INSERT INTO "ProductOrders" ("OrderQuantity", "OrderId", "ProductId")
VALUES (3, 1, 1);
        

--  Add an order quantity of 2 for the product named Flowbee to the order X529
INSERT INTO "ProductOrders" ("OrderQuantity", "OrderId", "ProductId")
VALUES (2, 1, 2);

--  Given a building, return all employees that work in that building. Show this query for buildings named North Side, East Side, 
-- and finally a building that you actually have in your data -- even if your data doesn't have any departments in those buildings. 
-- NOTE this means you can't manually look up Ids and use them, you have to let SQL do that work. (Hint: JOIN)
SELECT *
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Building" = 'North Side';

SELECT *
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Building" = 'East Side';

SELECT *
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Building" = 'Main';

--  Find all orders that contain the product id of 2.
SELECT *
FROM "ProductOrders"
JOIN "Orders" ON "ProductOrders"."OrderId" = "Orders"."id"
where "ProductId" = 2;

--  Find the quantity of the Flowbee product from order with order number X529.
-- You may not write the value of an Id in your query, let SQL do the work (HINT: JOIN)
select "OrderQuantity", "Name", "OrderNumber"
from "ProductOrders"
join "Products" on "ProductOrders"."ProductId" = "Products"."id"
join "Orders" on "ProductOrders"."OrderId" = "Orders"."id"
where "OrderNumber" = 'X529' and "Name" = 'Flowbee';