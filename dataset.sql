CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Ayesha', 'Pakistan'),
(2, 'Ali', 'UAE'),
(3, 'Sara', 'Pakistan'),
(4, 'John', 'USA'),
(5, 'Emma', 'UK');

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, '2023-01-10', 5000),
(102, 2, '2023-01-15', 7000),
(103, 1, '2023-02-10', 3000),
(104, 3, '2023-02-12', 8000),
(105, 4, '2023-03-01', 2000),
(106, 5, '2023-03-05', 9000),
(107, 2, '2023-03-10', 4000),
(108, 3, '2023-04-01', 6000);

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 1000),
(2, 'Phone', 'Electronics', 800),
(3, 'Shoes', 'Fashion', 200),
(4, 'Watch', 'Accessories', 300);


CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO order_items VALUES
(101, 1, 1),
(102, 2, 2),
(103, 3, 3),
(104, 1, 1),
(105, 4, 2),
(106, 2, 1),
(107, 3, 2),
(108, 1, 1);
