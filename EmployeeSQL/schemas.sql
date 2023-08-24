-- departments
CREATE TABLE "departments" (
    "dept_no" varchar NOT NULL PRIMARY KEY,
    "dept_name" varchar NOT NULL
);

-- titles
CREATE TABLE "titles" (
    "title_id" varchar NOT NULL PRIMARY KEY,
    "title" varchar NOT NULL
);

-- employees
CREATE TABLE "employees" (
    "emp_no" varchar NOT NULL PRIMARY KEY,
    "emp_title_id" varchar NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "sex" varchar NOT NULL,
    "hire_date" date NOT NULL
);

-- salaries
CREATE TABLE "salaries" (
    "emp_no" varchar NOT NULL PRIMARY KEY,
    "salary" decimal NOT NULL
);

-- dept_manager
CREATE TABLE "dept_manager" (
    "dept_no" varchar NOT NULL,
    "emp_no" varchar NOT NULL
);

-- dempt_emp
CREATE TABLE "dempt_emp" (
    "emp_no" varchar NOT NULL,
    "dept_no" varchar NOT NULL
);

-- Foreign key constraints

-- dempt_emp
ALTER TABLE "dempt_emp" ADD CONSTRAINT "fk_dempt_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dempt_emp" ADD CONSTRAINT "fk_dempt_emp_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

-- dept_manager
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

-- employees
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id")
REFERENCES "titles" ("title_id");
