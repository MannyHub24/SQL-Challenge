# Pewlett Hackard SQL Challenge

## 📊 Project Overview
This project simulates a data engineering task for a fictional company, Pewlett Hackard. The goal was to:
- Design and create a SQL database from CSV files
- Import the data into PostgreSQL using pgAdmin 4
- Perform SQL queries to answer key business questions

---

## 📁 Files Included
- `postgres_table_schemas.sql`: SQL script containing all CREATE TABLE statements
- `analysis_queries.sql`: SQL script with 8 SELECT queries for analysis
- `ERD.png`: Entity Relationship Diagram created in QuickDBD
- `data/`: Folder containing six CSV files (employees, departments, dept_emp, dept_manager, salaries, titles)

---

## 🛠 Technologies Used
- PostgreSQL 13
- pgAdmin 4
- QuickDBD (for the ERD)
- SQL

---

## 🗂 Database Schema

### Tables:
1. `employees`
2. `departments`
3. `dept_emp`
4. `dept_manager`
5. `salaries`
6. `titles`

Each table was created with appropriate primary and foreign keys to preserve referential integrity.

---

## 🔍 Data Analysis Queries
Eight queries were written to answer the following business questions:
1. List employee details and salaries.
2. List employees hired in 1986.
3. List department managers with department info.
4. List each employee with their department.
5. List employees whose first name is Hercules and last name starts with 'B'.
6. List all employees in the Sales department.
7. List employees in Sales or Development departments.
8. Count how many employees share the same last name, ordered from most common.

---

## 🚀 How to Run

1. Open **pgAdmin 4** and connect to your PostgreSQL server.
2. Create a new database: `pewlett_hackard_db`.
3. Open `postgres_table_schemas.sql` in the Query Tool and run it to create all tables.
4. Import the six CSV files into their respective tables in the correct order:
   - `titles`, `employees`, `departments`, `salaries`, `dept_emp`, `dept_manager`
5. Run `analysis_queries.sql` to generate results for each business question.

---

## ✅ Author
Manuel Guevara

