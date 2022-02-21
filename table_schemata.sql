
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees cascade;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
CREATE TABLE "departments" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

COPY departments
FROM 'Desktop\EmployeeSQL\data\departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp
FROM 'Desktop\EmployeeSQL\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager
FROM 'Desktop\EmployeeSQL\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY employees
FROM 'Desktop\EmployeeSQL\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY salaries
FROM 'Desktop\EmployeeSQL\data\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY titles
FROM 'Desktop\EmployeeSQL\data\titles.csv'
DELIMITER ','
CSV HEADER;

-- foreign keys are added here to allow for the import
--these were also taken from QuickDBD
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

