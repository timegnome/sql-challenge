-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
CREATE TABLE "departments" (
    "dept_no" varchar(6)   NOT NULL,
    "dept_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(30)   NOT NULL,
    "birth_date" varchar(12)   NOT NULL,
    "first_name" varchar(25)   NOT NULL,
    "last_name" varchar(25)   NOT NULL,
    "sex" char   NOT NULL,
    "hire_date" varchar(12)   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees_junct" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(6)   NOT NULL
);

CREATE TABLE "department_manager" (
    "dept_no" varchar(6)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employee_salary" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "employees_junct" ADD CONSTRAINT "fk_employees_junct_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "employees_junct" ADD CONSTRAINT "fk_employees_junct_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "employee_salary" ADD CONSTRAINT "fk_employee_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");