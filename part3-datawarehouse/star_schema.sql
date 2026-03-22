-- DIM DATE

CREATE TABLE dim_date (
date_id INT PRIMARY KEY,
month INT,
year INT
);

-- DIM STORE

CREATE TABLE dim_store (
store_id INT PRIMARY KEY,
store_name VARCHAR(100),
city VARCHAR(50)
);

-- DIM PRODUCT

CREATE TABLE dim_product (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50)
);

-- FACT TABLE

CREATE TABLE fact_sales (
transaction_id VARCHAR(20) PRIMARY KEY,
date_id INT,
store_id INT,
product_id INT,
units_sold INT,
revenue DECIMAL(12,2),

FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- CLEANED DIM DATA

INSERT INTO dim_date VALUES
(1,1,2024),
(2,2,2024),
(3,3,2024);

INSERT INTO dim_store VALUES
(101,'Chennai A','Chennai'),
(102,'Delhi South','Delhi'),
(103,'Bangalore B','Bangalore'),
(104,'Pune FC R','Pune'),
(105,'Mumbai C','Mumbai');

INSERT INTO dim_product VALUES
(201,'Speaker','Electronics'),
(202,'Tablet','Electronics'),
(203,'Phone','Electronics'),
(204,'Smartwatch','Electronics'),
(205,'Jeans','Clothing'),
(206,'Jacket','Clothing'),
(207,'Saree','Clothing'),
(208,'Atta 10kg','Grocery'),
(209,'Milk 1L','Grocery'),
(210,'Biscuits','Grocery'),
(211,'Laptop','Electronics');

-- FACT DATA (10+ rows)

INSERT INTO fact_sales VALUES
('TXN5000',1,101,201,3,147788.34),
('TXN5001',1,101,202,11,255487.32),
('TXN5002',1,101,203,20,974067.80),
('TXN5003',1,102,202,14,325165.68),
('TXN5004',1,101,204,10,588510.10),
('TXN5005',1,103,208,12,629568.00),
('TXN5006',1,104,204,6,353106.06),
('TXN5007',1,104,205,16,37079.52),
('TXN5008',1,103,210,9,247499.91),
('TXN5009',1,103,204,3,176553.03),
('TXN5010',1,101,206,15,452808.60);

