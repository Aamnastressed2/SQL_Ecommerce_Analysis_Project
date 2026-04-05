CREATE TABLE employees1 (
    emp_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT
);

INSERT INTO employees VALUES
(1, 'Ayesha', 'Khan', 'HR', 6000, 28),
(2, 'Ali', 'Raza', 'IT', 4500, 32),
(3, 'Sara', 'Ahmed', 'Finance', 7000, 40),
(4, 'Usman', 'Ali', 'IT', 3000, 25),
(5, 'Hina', 'Sheikh', 'HR', 5200, 35),
(6, 'Bilal', 'Malik', 'Finance', 800, 29),
(7, 'Zara', 'Iqbal', 'IT', 9000, 45),
(8, 'Omar', 'Farooq', 'HR', 1500, 38),
(9, 'Noor', 'Hassan', 'Finance', 11000, 50),
(10, 'Danish', 'Aslam', 'IT', 2000, 27);

CREATE TABLE departments1 (
    department VARCHAR(50),
    manager_name VARCHAR(50)
);

INSERT INTO departments VALUES
('HR', 'Fatima'),
('IT', 'Usman'),
('Finance', 'Ahmed'),
('Marketing', 'Zoya');