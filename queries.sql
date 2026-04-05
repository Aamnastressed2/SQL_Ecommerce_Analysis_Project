-- ============================================
-- Project: Employee Analytics System
-- Skills Used: Joins, Subqueries, Window Functions, CASE, Aggregations
-- Description: Analyzed employee data to extract insights on salary distribution,
-- department performance, and employee ranking.
-- ============================================

-- ============================================
-- 1. Employee Overview
-- ============================================

SELECT 
    CONCAT(emp.first_name, ' ', emp.last_name) AS full_name,
    emp.department,
    dep.manager_name,
    emp.salary
FROM employees emp
LEFT JOIN departments dep
ON emp.department = dep.department
ORDER BY emp.department;

-- ============================================
-- 2. Department Insights
-- ============================================

SELECT 
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- ============================================
-- 3. Top Performers
-- ============================================
SELECT department, first_name, salary
FROM employees e1
WHERE salary= (
				SELECT MAX(salary)
                FROM employees e2
                WHERE e1.department=e2.department
)
;
-- ============================================
-- 4. Salary Analysis
-- ============================================
SELECT first_name, (salary), department, AVG(salary) 
OVER (PARTITION BY department) AS dept_avg_sal , 
salary - AVG(salary)OVER (PARTITION BY department) AS salary_difference
FROM employees;

-- ============================================
-- 5. Ranking
-- ============================================
SELECT first_name, salary,
RANK () OVER (PARTITION BY DEPARTMENT ORDER BY salary DESC) AS rank_num
from employees;

-- ============================================
-- 6. Salary Categories
-- ============================================
SELECT first_name, salary, department,
CASE 
    WHEN salary < 2000 THEN 'Low'
    WHEN salary BETWEEN 2000 AND 5000 THEN 'Medium'
    WHEN salary > 5000 THEN 'High'
END AS salary_categories
FROM employees;

-- 7. Most Expensive Department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

-- ============================================
-- Find:Employees earning above their department average
-- ============================================

SELECT first_name, salary,department
FROM employees e1
WHERE salary > ( 
				 SELECT AVG(salary) 
                 FROM employees e2
                WHERE e1.department= e2.department
);







