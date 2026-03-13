-- Customers Table

CREATE TABLE Customers (

    customer_id VARCHAR(10) PRIMARY KEY,

    customer_name VARCHAR(100) NOT NULL,

    customer_email VARCHAR(100),

    city VARCHAR(50) NOT NULL

);


INSERT INTO Customers VALUES

('C001','Rohan Mehra','rohan@gmail.com','Mumbai'),

('C002','Priya Sharma','priya@gmail.com','Delhi'),

('C003','Amit Verma','amit@gmail.com','Bangalore'),

('C004','Sneha Iyer','sneha@gmail.com','Chennai'),

('C005','Vikram Singh','vikram@gmail.com','Mumbai');


-- Products Table

CREATE TABLE Products (

    product_id VARCHAR(10) PRIMARY KEY,

    product_name VARCHAR(100) NOT NULL,

    category VARCHAR(50),

    unit_price DECIMAL(10,2) NOT NULL

);


INSERT INTO Products VALUES

('P001','Laptop','Electronic',55000),

('P002','Mouse','Electronic',800),

('P003','Desk Chair','Furniture',8500),

('P004','Notebook','Stationery',120),

('P007','Pen Set','Stationery',250);



-- Sales Representative Table

CREATE TABLE Sales_Rep (

    sales_rep_id VARCHAR(10) PRIMARY KEY,

    sales_rep_name VARCHAR(100) NOT NULL,

    office_address VARCHAR(200)

);



INSERT INTO Sales_Rep VALUES

('SR01','Deepak Jain','Mumbai HQ'),

('SR02','Anita Desai','Delhi Office'),

('SR03','Ravi Kumar','Bangalore Office'),

('SR04','Karan Shah','Chennai Office'),

('SR05','Meena Rao','Hyderabad Office');



-- Orders Table

CREATE TABLE Orders (

    order_id VARCHAR(10) PRIMARY KEY,

    order_date DATE,

    customer_id VARCHAR(10),

    sales_rep_id VARCHAR(10),

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Rep(sales_rep_id)

);


INSERT INTO Orders VALUES

('ORD1114','2024-01-10','C001','SR02'),

('ORD1153','2024-01-11','C002','SR01'),

('ORD1002','2024-01-12','C002','SR01'),

('ORD1118','2024-01-13','C003','SR02'),

('ORD1075','2024-01-14','C005','SR03');



-- Order Items Table

CREATE TABLE Order_Items (

    order_item_id INT PRIMARY KEY,

    order_id VARCHAR(10),

    product_id VARCHAR(10),

    quantity INT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),

    FOREIGN KEY (product_id) REFERENCES Products(product_id)

);


INSERT INTO Order_Items VALUES

(1,'ORD1114','P007',2),

(2,'ORD1153','P007',3),

(3,'ORD1002','P004',1),

(4,'ORD1118','P007',5),

(5,'ORD1075','P003',2);
