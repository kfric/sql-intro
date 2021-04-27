-- create table
CREATE TABLE "Employees" (
  "id"             SERIAL PRIMARY KEY,
  "FullName"       TEXT NOT NULL,
  "Salary"         INT,
  "JobPosition"    TEXT NOT NULL,
  "PhoneExtension" INT,
  "IsPartTime"     TEXT NOT NULL
);

-- add employee values
INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Karl Frick', '9000', 'Bike Tech', '5', 'Yes');
 
INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Nate Pham', '5000', 'Boba Artist', '16', 'Yes');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Tyler Dietrich', '8500', 'Recruiter', '2', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Danny Le', '4000', 'Server', '11', 'Yes');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lana Kostuch', '6700', 'Inventory Specialist', '107', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('CJ Zelinsky', '8500', 'Recruiter', '117', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Vy Tran', '9000', 'Recruiter', '304', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Sam Ioannidis', '3000', 'Receptionist', '55', 'Yes');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Alex Dang', '10000', 'Doctor', '305', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Kristina Frick', '5000', 'Store Manager', '1356', 'No');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Pablo Excobar', '800', 'Cook', '999', 'Yes');

INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Lary', '200', 'Cook', '333', 'Yes');


-- select all columns for all employees
SELECT * FROM "CompanyDatabase";


-- Select only the full names and phone extensions for only full-time employees.
SELECT "FullName", "PhoneExtension" FROM "CompanyDatabase" WHERE "IsPartTime" = 'No';

-- Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
INSERT INTO "CompanyDatabase" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('John Deere', '450', 'Software Developer', '111', 'Yes');

-- Update all employees that are cooks to have a salary of 500.
UPDATE "CompanyDatabase"
SET "Salary" = '500'
WHERE "JobPosition" = 'Cook';

-- Delete all employees that have the full name of "Lazy Larry".
delete from "CompanyDatabase" where "FullName" = 'Lazy Larry';

-- Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.
alter table "CompanyDatabase" add column "ParkingSpot" varchar(10);
